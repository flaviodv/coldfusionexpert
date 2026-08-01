(function ($) {
	// Auto-clean any bad "#[object Object]" hash from the URL, on load and if it ever reappears
	function cleanBadHash() {
		if (window.location.hash && window.location.hash.indexOf('object') !== -1) {
			if (window.history && window.history.replaceState) {
				window.history.replaceState(null, null, window.location.pathname + window.location.search);
			}
		}
	}
	cleanBadHash();
	window.addEventListener('hashchange', cleanBadHash);

	// Tools section: generic "Copy to clipboard" button, shared by every tool widget.
	// Usage: <button class="tool-copy" data-copy-target="idOfInputOrTextarea">
	$(document).on('click', '.tool-copy[data-copy-target]', function () {
		var $btn = $(this);
		var target = document.getElementById($btn.data('copy-target'));
		if (!target) {
			return;
		}
		var text = ('value' in target) ? target.value : target.textContent;
		var isEs = document.documentElement.lang === 'es';
		var originalHtml = $btn.data('original-html') || $btn.html();
		$btn.data('original-html', originalHtml);

		function showCopied() {
			$btn.html('<i class="fas fa-check"></i> ' + (isEs ? '¡Copiado!' : 'Copied!'));
			setTimeout(function () {
				$btn.html(originalHtml);
			}, 1500);
		}

		function fallbackCopy() {
			var ta = document.createElement('textarea');
			ta.value = text;
			ta.style.position = 'fixed';
			ta.style.opacity = '0';
			document.body.appendChild(ta);
			ta.select();
			try {
				document.execCommand('copy');
			} catch (e) {}
			document.body.removeChild(ta);
			showCopied();
		}

		if (navigator.clipboard && navigator.clipboard.writeText) {
			navigator.clipboard.writeText(text).then(showCopied, fallbackCopy);
		} else {
			fallbackCopy();
		}
	});

	// Tools left sidebar: collapsible category groups
	$(document).on('click', '.tools-sidebar-cat-toggle', function () {
		var $toggle = $(this);
		var $category = $toggle.closest('.tools-sidebar-category');
		var willOpen = !$category.hasClass('open');
		if (willOpen) {
			$category.siblings('.tools-sidebar-category').removeClass('open')
				.find('.tools-sidebar-cat-toggle').attr('aria-expanded', 'false');
		}
		$category.toggleClass('open', willOpen);
		$toggle.attr('aria-expanded', willOpen ? 'true' : 'false');
	});

	// Tools landing page: horizontal category chip filter (desktop only, CSS hides it below 901px)
	$(document).on('click', '.tool-chip[data-filter]', function () {
		var $chip = $(this);
		var filter = $chip.data('filter');
		$chip.addClass('active').siblings('.tool-chip').removeClass('active');
		$('.tools-category-section').each(function () {
			var $section = $(this);
			var show = (filter === 'all' || $section.data('category') === filter);
			$section.toggleClass('tools-category-hidden', !show);
		});
	});

	"use strict";

	// Header Type = Fixed
  $(window).scroll(function() {
    var scroll = $(window).scrollTop();

    if (scroll > 50) {
      $("header").addClass("background-header");
    } else {
      $("header").removeClass("background-header");
    }
  });


	$('.loop').owlCarousel({
      center: true,
      items:1,
      loop:true,
      autoplay: true,
      nav: true,
      margin:0,
      responsive:{ 
          1200:{
              items:5
          },
          992:{
              items:3
          },
          760:{
            items:2
        }
      }
  });

  $('.tools-carousel').owlCarousel({
    items: 4,
    margin: 20,
    nav: true,
    dots: true,
    loop: false,
    responsive: {
      0: { items: 1 },
      600: { items: 2 },
      992: { items: 3 },
      1200: { items: 4 }
    }
  });

  $("#modal_trigger").leanModal({
		top: 100,
		overlay: 0.6,
		closeButton: ".modal_close"
});

$(function() {
		// Calling Login Form
		$("#login_form").click(function() {
				$(".social_login").hide();
				$(".user_login").show();
				return false;
		});

		// Calling Register Form
		$("#register_form").click(function() {
				$(".social_login").hide();
				$(".user_register").show();
				$(".header_title").text('Register');
				return false;
		});

		// Going back to Social Forms
		$(".back_btn").click(function() {
				$(".user_login").hide();
				$(".user_register").hide();
				$(".social_login").show();
				$(".header_title").text('Login');
				return false;
		});
});

  // Acc
  $(document).on("click", ".naccs .menu div", function() {
    var numberIndex = $(this).index();

    if (!$(this).is("active")) {
        $(".naccs .menu div").removeClass("active");
        $(".naccs ul li").removeClass("active");

        $(this).addClass("active");
        $(".naccs ul").find("li:eq(" + numberIndex + ")").addClass("active");

        var listItemHeight = $(".naccs ul")
          .find("li:eq(" + numberIndex + ")")
          .innerHeight();
        $(".naccs ul").height(listItemHeight + "px");
      }
  });
	

	// Menu Dropdown Toggle
  if($('.menu-trigger').length){
    $(".menu-trigger").on('click', function() { 
      $(this).toggleClass('active');
      $('.header-area .nav').slideToggle(200);
    });
  }


  // Menu elevator animation
  $('.scroll-to-section a[href*=\\#]:not([href=\\#])').on('click', function() {
    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
      if (target.length) {
        var width = $(window).width();
        if(width < 991) {
          $('.menu-trigger').removeClass('active');
          $('.header-area .nav').slideUp(200);  
        }       
        $('html,body').animate({
          scrollTop: (target.offset().top) + 1
        }, 700);
        return false;
      }
    }
  });

  $(document).ready(function () {
      $(document).on("scroll", onScroll);
      
      //smoothscroll
      $('.scroll-to-section a[href^="#"]').on('click', function (e) {
          e.preventDefault();
          $(document).off("scroll");
          
          $('.scroll-to-section a').each(function () {
              $(this).removeClass('active');
          });
          $(this).addClass('active');
        
          var targetHash = typeof this.hash === 'string' ? this.hash : '';
          var target = targetHash ? $(targetHash) : $();
          if (target.length) {
            $('html, body').stop().animate({
                scrollTop: (target.offset().top) + 1
            }, 500, 'swing', function () {
                if (/^#[\w-]+$/.test(targetHash)) {
                    if (history.pushState) {
                        history.pushState(null, null, targetHash);
                    } else {
                        window.location.hash = targetHash;
                    }
                }
                $(document).on("scroll", onScroll);
            });
          } else {
            $(document).on("scroll", onScroll);
          }
      });
  });

  function onScroll(event){
      var scrollPos = $(document).scrollTop();
      $('.nav a').each(function () {
          var currLink = $(this);
          var hrefVal = currLink.attr("href");
          if (hrefVal && hrefVal.indexOf("#") === 0 && hrefVal.length > 1) {
              var refElement = $(hrefVal);
              if (refElement.length && refElement.position()) {
                  if (refElement.position().top <= scrollPos + 20 && refElement.position().top + refElement.height() > scrollPos) {
                      $('.nav ul li a').removeClass("active");
                      currLink.addClass("active");
                  }
                  else{
                      currLink.removeClass("active");
                  }
              }
          }
      });
  }

	// Page loading animation
	 $(window).on('load', function() {

        $('#js-preloader').addClass('loaded');

    });

	

	// Window Resize Mobile Menu Fix
  function mobileNav() {
    var width = $(window).width();
    $('.submenu').on('click', function() {
      if(width < 767) {
        $('.submenu ul').removeClass('active');
        $(this).find('ul').toggleClass('active');
      }
    });
  }

	// Global Active Timer Indicator in Header
	function formatTimeDigitsGlobal(sec) {
		var h = Math.floor(sec / 3600);
		var m = Math.floor((sec % 3600) / 60);
		var s = sec % 60;
		return (h < 10 ? '0' + h : h) + ':' + (m < 10 ? '0' + m : m) + ':' + (s < 10 ? '0' + s : s);
	}

	function updateGlobalHeaderTimer() {
		var isEs = document.documentElement.lang === 'es';
		var multiTimers = {};
		var countdowns = {};

		try {
			var mtData = localStorage.getItem('cfexpert_tracker_multi_timers');
			if (mtData) multiTimers = JSON.parse(mtData);
		} catch(e) {}

		try {
			var cdData = localStorage.getItem('cfexpert_tracker_countdowns');
			if (cdData) countdowns = JSON.parse(cdData);
		} catch(e) {}

		var activeList = [];

		// Check multi timers (slots 1..3)
		[1, 2, 3].forEach(function(slot) {
			var t = multiTimers[slot];
			if (t && t.startTime) {
				var elapsed = Math.max(0, Math.floor((Date.now() - new Date(t.startTime).getTime()) / 1000));
				activeList.push({
					type: 'timer',
					slot: slot,
					desc: t.description || (isEs ? 'Reloj ' + slot : 'Timer ' + slot),
					elapsed: elapsed
				});
			}
		});

		// Check countdown timers (slots 4..5)
		[4, 5].forEach(function(slot) {
			var c = countdowns[slot];
			if (c && c.endTime) {
				var remaining = Math.max(0, Math.ceil((new Date(c.endTime).getTime() - Date.now()) / 1000));
				if (remaining > 0) {
					activeList.push({
						type: 'countdown',
						slot: slot,
						desc: c.description || (isEs ? 'Temporizador ' + (slot - 3) : 'Countdown ' + (slot - 3)),
						remaining: remaining
					});
				}
			}
		});

		var $badge = $('#global-floating-timer-bar');

		if (activeList.length === 0) {
			if ($badge.length) $badge.css('display', 'none');
			return;
		}

		if (!$badge.length) {
			$badge = $('<a id="global-floating-timer-bar" href="/tools/time-tracker.cfm" class="global-floating-timer-bar"></a>');
			$('body').append($badge);
		}

		var first = activeList[0];
		var displayTime = first.type === 'timer' ? formatTimeDigitsGlobal(first.elapsed) : formatTimeDigitsGlobal(first.remaining);

		var label = '';
		if (activeList.length === 1) {
			var icon = first.type === 'timer' ? '⏱️ ' : '⏳ ';
			label = icon + first.desc + ' ';
		} else {
			label = (isEs ? '⏱️ ' + activeList.length + ' Activos ' : '⏱️ ' + activeList.length + ' Active ');
		}

		$badge.html(
			'<span class="global-timer-dot"></span> ' +
			'<span style="color:#ffffff !important; font-weight:700;">' + label + '</span>' +
			'<span class="global-timer-time">[' + displayTime + ']</span>'
		).css('display', 'inline-flex');
	}

	setInterval(updateGlobalHeaderTimer, 1000);
	$(document).ready(updateGlobalHeaderTimer);

})(window.jQuery);
