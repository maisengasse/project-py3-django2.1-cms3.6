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

    $('.hamburger').on('click', function() {
      $('.hamburger').toggleClass("is-active");
    });

    maisen.commands.run();
};

maisen.commands = {
    additional : [],
    run : function(context) {
        this.context = context || $(document);
        this.cmd('initForms', "form");
        this.cmd('fancyBox', "[data-fancybox]");
        this.cmd('slickSlider', "[data-slickslider]");
        this.cmd('hyphenate', '*[data-hyphenate]');
        this.cmd('targetBlank', 'a[data-target-blank]');
        this.cmd('scrollToID', 'a[href^=#]');
        this.cmd('lazyLoadImages', 'img[data-original]');
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
    lazyLoadImages : function(node) {
        var src = node.attr('data-original');
        node.attr('data-original', src);
        node.lazyload({
            effect : 'fadeIn'
        });
    },
    scrollToID : function(node) {
        node.on('click', function(event) {
            event.preventDefault();
            var target = $(node.attr("href"));
            var offset = target.offset();
            if (offset) $("html, body").animate({scrollTop : offset.top - 100}, 500);
        });
    },
    fancyBox : function(node) {
        //selfinit

        // $('a[data-fancybox]').fancybox({
        //     afterClose : function() {
        //         $(this).trigger('fancybox.close');
        //     },
        //     beforeShow : function() {
        //         $(this.element).trigger('fancybox.open');
        //     }
        // });
        // $('a[data-fancybox-iframe]').attr('data-fancybox-type', 'iframe');
        // $('a[data-fancybox-iframe]').fancybox({
        //     type : 'iframe',
        //     padding : 0,
        //     margin : [5, 5, 5, 5],
        //     width : "100%",
        //     height : '100%',
        //     afterClose : function() {
        //         $(this.element).trigger('fancybox.close');
        //     },
        //     beforeShow : function() {
        //         $(this.element).trigger('fancybox.open');
        //     }
        // });
    },
    slickSlider : function(node) {
        node.slick({
            arrows : true,
            dots : true,
            adaptiveHeight : true
        });
    },
    targetBlank : function(node) {
        node.attr('target', '_blank');
    },
    hyphenate : function(node) {
        var lang = $('html').prop('lang') || 'de';
        node.hyphenate(lang);
    },
    initForms : function(node) {
        node.find('.datepicker-wrap input').each(function() {
            var node = $(this);
            node.datepicker({
                language: 'de',
                format:'dd.mm.yyyy',
                startDate : new Date()
            });
        });

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
