"use strict";
/* global maisen:true */
/* global $:false */
/* global jQuery:false */
/* global window:false */
/* global console:false */
try { maisen = maisen || {};} catch(e){ var maisen = {};}

maisen.nothing = function() {};
maisen.init = function() {
    maisen.utils.init();
    maisen.commands.run();
    objectFitImages();
};

maisen.commands = {
    additional : [],
    run : function(context) {
        this.context = context || $(document);

        //bs4
        this.context.find('[data-toggle="tooltip"]').tooltip();

        //commands
        this.cmd('initForms', "form");
        this.cmd('inputUnit', '*[data-inputunit]');
        this.cmd('hamburger', ".hamburger");
        this.cmd('fancyBox', "[data-fancybox]");
        this.cmd('slickSlider', "[data-slickslider]");
        this.cmd('slicksliderDot', '[data-toggle="slicksliderdot"]');
        this.cmd('targetBlank', 'a[data-target-blank]');
        this.cmd('scrollToID', 'a[href^="#"]');
        this.cmd('maisenDropdownNav', 'body');
        this.cmd('clientSideInclude', '*[data-csi]');
        this.cmd('iframeModal', '#iframe-modal');
        this.runAdditional(this.context);
    },
    add : function(cb) {
        this.additional.push(cb);
    },
    cmd : function(command, selector) {
        var set = $(selector, this.context);
        if (!set.length) return;
        if (typeof maisen.commands[command] != "function") {
            console.error("unknown command", command, "for", set);
            return;
        }
        set.each(function() {
            maisen.commands[command]($(this));
        });
    },
    hamburger : function(node) {
        node.on('click', function() {
          node.toggleClass("is-active");
        });
    },
    runAdditional : function(context) {
        for(var i=0; i<this.additional.length;i++) {
            this.additional[i].call(this, context);
        }
    },
    clientSideInclude : function(node) {
        var url = node.attr('data-url');
        node.removeAttr('data-url');
        node.load(url, function() {
            var loaded = node.children();
            loaded.unwrap();
            maisen.commands.run(loaded);
        });
    },
    scrollToID : function(node) {
        if ($(node.attr("href").length < 2)) return;
        node.on('click', function(event) {
            event.preventDefault();
            var target = $(node.attr("href"));
            var offset = target.offset();
            if (offset) $("html, body").animate({scrollTop : offset.top - 100}, 500);
        });
    },
    fancyBox : function(node) {
        //selfinit
    },
    slicksliderDot : function(node) {
        var target = $(node.data('slicksliderdot-for'));
        if (target.length) {
            var allLinks = $('[data-slicksliderdot-for="'+node.data('slicksliderdot-for')+'"]');
            var index = parseInt(node.data('slicksliderdot-index'), 10);

            //activate on click
            node.on('click', function(e) {
                e.preventDefault();
                target.slick('slickGoTo', index);
                allLinks.removeClass('active');
                node.addClass('active');
            });

            //mark active on change
            target.on('beforeChange', function(event, slick, currentSlide, nextSlide){
                if (nextSlide == index) {
                    allLinks.removeClass('active');
                    node.addClass('active');
                };
            });

        }
    },
    slickSlider : function(node) {
        var cfg = {
            arrows : node.attr('data-slickslider-arrows') != "0",
            dots : node.attr('data-slickslider-dots') != "0",
            infinite : node.attr('data-slickslider-loop') != "0",
            fade : node.data('slickslider-fade') == "1",
            adaptiveHeight : true,
            cssEase: 'ease',
            useTransform: true,
        };

        if ($(window).width() > 767) {
            if (node.is('[data-slickslider-centered]')) {
                var cp = (($(window).width()-$('.container').width()-20) / 2);
                cfg.centerMode = true;
                cfg.centerPadding = cp+"px";
            }
        }

        if (node.is('[data-slickslider-lazy]')) {
            cfg.lazyLoad = 'ondemand';
            cfg.adaptiveHeight = false;
        };

        if (node.attr('data-slickslider-autoplay')) {
            cfg.autoplay = true;
            cfg.autoplaySpeed = parseInt(node.attr('data-slickslider-autoplay'), 10);
        }

        if (node.attr('data-slickslider-navfor')) {
            cfg.asNavFor = node.attr('data-slickslider-navfor');
            cfg.focusOnSelect = true;
        }

        if (node.attr('data-slickslider-show')) {
            var sst = parseInt(node.attr('data-slickslider-show'), 10);
            cfg.slidesToShow = sst;
            cfg.slidesToScroll = sst;
            cfg.responsive = [
                {
                  breakpoint: 1680,
                  settings: {
                    slidesToShow: sst/1.3333333,
                    slidesToScroll: sst/1.3333333
                  }
                },
                {
                  breakpoint: 1200,
                  settings: {
                    slidesToShow: sst/2,
                    slidesToScroll: sst/2
                  }
                },
                {
                  breakpoint: 768,
                  settings: {
                    slidesToShow: sst/4,
                    slidesToScroll: sst/4
                  }
                },
            ];
        }

        node.slick(cfg);

        //reinit on tab show
        var tabpane = node.closest('.tab-pane');
        if (tabpane.length) {
            var tab = $('[data-toggle="pill"][href="#'+tabpane.attr('id')+'"]');
            tab.on('shown.bs.tab', function() {
                node.slick("unslick");
                node.slick(cfg);
            });
        };
    },
    targetBlank : function(node) {
        node.attr('target', '_blank');
    },
    iframeModal : function(node) {
        var modal = node;
        var content = modal.find('.modal-body');
        var iframe = content.find('iframe');
        modal.on('hidden.bs.modal', function() {
            iframe.attr('src', 'about:blank');
        });
        $('[data-toggle=iframemodal]').each(function() {
            var opener = $(this);
            var href = opener.is('a') ? opener.attr('href') : opener.data('iframe');

            opener.on('click', function(e) {
                e.preventDefault();
                iframe.attr('src', 'about:blank').attr('src', href);
                modal.modal('show');
            });
        });
    },
    initForms : function(node) {
        node.find('.datepicker input').each(function() {
            var node = $(this);
            var datepicker = flatpickr(this, {
                locale: 'de',
                dateFormat:'d.m.Y',
                minDate : new Date(),
                // disableMobile: "true"
            });
            node.data("datepicker", datepicker);
        });

        node.find('select').selectpicker();
        node.find(":input[required]").prev('label').addClass('required')

        var form = node;
        form.preventDoubleSubmission();

        //z-index-hack
        // var zindex = 1000;
        // form.find(".form-group").each(function() {
        //     $(this).css('z-index', zindex);
        //     zindex--;
        // });
    },
    maisenDropdownNav : function(body) {
        var nav = body.find('#maisen-dropdown-nav');
        if (!nav.length) return;

        var toggle = $('[data-toggle="shownav"]');
        toggle.on('click', function() {
            body.removeClass('nav-closed').toggleClass('nav-open');
            if (!body.is('.nav-open')) body.addClass('nav-closed');
        });

        body.on('mouseenter mouseleave', '#maisen-dropdown-nav .dropdown', function (e) {
            var dropdown = $(e.target).closest('.dropdown');
            var menu = dropdown.children('.dropdown-menu');
            dropdown.addClass('show');
            menu.addClass('show');
            setTimeout(function () {
                dropdown[dropdown.is(':hover') ? 'addClass' : 'removeClass']('show');
                menu[dropdown.is(':hover') ? 'addClass' : 'removeClass']('show');
            }, 200);
        });

        nav.find('[data-toggle="navlevel"]').each(function() {
            var node = $(this);
            var level = node.next();
            if ($(window).width() > 768) {
                node.on('click', function(e) {
                    e.preventDefault();
                });
            } else {
                node.on('click', function(e) {
                    e.preventDefault();
                });
                level.children('[data-navlevel-back]').on('click', function() {
                    node.removeClass('show');
                    level.removeClass('show');
                });
            }
        });

    },
    inputUnit : function(node) {
        var input = node.find(':input');
        var unit = node.data('inputunit');
        var form = node.closest('form');

        form.on('submit', function() {
            var val = input.val();
            val = val.replace(unit, '').trim();
            input.val(val);
        });
        input.attr('pattern', '\\d+ ' + unit);
        input.on('focus', function() {
            var val = input.val();
            val = val.replace(unit, '').trim();
            input.val(val);
        });
        input.on('blur', function() {
            var val = input.val();
            if (val.match(/^\d+$/)) input.val(val + ' ' + unit);
        });
        input.trigger('blur');
    },
};

maisen.utils = {
    init : function() {
        this.initPlugins();
        this.initEvents();
    },
    initEvents : function() {
        $(window).on('resize', function(e) {
            var ww = $(window).width();
            if (ww != maisen.winWidth) {
                maisen.winWidth = ww;
                $(window).trigger('changewidth', e);
            }
        });
    },
    initPlugins : function() {
        jQuery.fn.preventDoubleSubmission = function() {
          $(this).on('submit',function(e){
            var $form = $(this);
            $form.addClass('submitting');

            if ($form.data('submitted') === true) {
              // Previously submitted - don't submit again
              e.preventDefault();
            } else {
              // Mark it so that the next submit can be ignored
              $form.data('submitted', true);
            }
          });
          // Keep chainability
          return this;
        };
    }
};

$(document).ready(function(){
    maisen.init();
});
