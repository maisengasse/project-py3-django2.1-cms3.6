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
};

maisen.commands = {
    additional : [],
    run : function(context) {
        this.context = context || $(document);
        this.cmd('initForms', "form");
        this.cmd('hamburger', ".hamburger");
        this.cmd('fancyBox', "[data-fancybox]");
        this.cmd('slickSlider', "[data-slickslider]");
        this.cmd('targetBlank', 'a[data-target-blank]');
        this.cmd('scrollToID', 'a[href^=#]');
        this.cmd('clientSideInclude', '*[data-csi]');
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
        if (!$(node.attr("href").length)) return;
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
    slickSlider : function(node) {
        var cfg = {
            arrows : node.is('[data-slickslider-arrows]') != "0",
            dots : node.attr('data-slickslider-dots') != "0",
            infinite : node.attr('data-slickslider-loop') != "0",
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
    initForms : function(node) {
        // node.find('.datepicker-wrap input').each(function() {
        //     var node = $(this);
        //     node.datepicker({
        //         language: 'de',
        //         format:'dd.mm.yyyy',
        //         startDate : new Date()
        //     });
        // });

        node.find(":input[required]").prev('label').addClass('required')

        var form = node;
        form.preventDoubleSubmission();

        //z-index-hack
        var zindex = 1000;
        form.find(".form-group").each(function() {
            $(this).css('z-index', zindex);
            zindex--;
        })
    }
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
