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

	// Tools mobile burger menu: collapsible category groups (mirrors the desktop sidebar behavior)
	$(document).on('click keypress', '.nav-category-label[data-category]', function (e) {
		if (e.type === 'keypress' && e.which !== 13 && e.which !== 32) {
			return;
		}
		e.preventDefault();
		var $label = $(this);
		var category = $label.data('category');
		var willOpen = !$label.hasClass('open');
		if (willOpen) {
			$('.nav-category-label').removeClass('open').attr('aria-expanded', 'false');
		}
		$label.toggleClass('open', willOpen);
		$label.attr('aria-expanded', willOpen ? 'true' : 'false');
		$('.nav-tool-item').each(function () {
			var $item = $(this);
			$item.toggleClass('visible', willOpen && $item.data('category') === category);
		});
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

	// Tools landing page: keep the sidebar category aligned with the section
	// that occupies most of the viewport. Individual tool pages have no category
	// sections, so their server-rendered active state remains untouched.
	(function initToolsSidebarSectionObserver() {
		var sections = document.querySelectorAll('.tools-main .tools-category-section[data-category]');
		if (!sections.length || !('IntersectionObserver' in window)) {
			return;
		}

		var visibleSections = {};

		function activateCategory(category) {
			var categories = document.querySelectorAll('.tools-sidebar-category[data-category]');
			categories.forEach(function (item) {
				var isCurrent = item.getAttribute('data-category') === category;
				item.classList.toggle('open', isCurrent);
				item.classList.toggle('is-current', isCurrent);
				var toggle = item.querySelector('.tools-sidebar-cat-toggle');
				if (toggle) {
					toggle.setAttribute('aria-expanded', isCurrent ? 'true' : 'false');
				}
			});
		}

		function updateActiveCategory() {
			var active = null;
			Object.keys(visibleSections).forEach(function (category) {
				if (!active || visibleSections[category] > visibleSections[active]) {
					active = category;
				}
			});
			if (active) {
				activateCategory(active);
			}
		}

		var observer = new IntersectionObserver(function (entries) {
			entries.forEach(function (entry) {
				var category = entry.target.getAttribute('data-category');
				if (entry.isIntersecting && !entry.target.classList.contains('tools-category-hidden')) {
					visibleSections[category] = entry.intersectionRect.height;
				} else {
					delete visibleSections[category];
				}
			});
			updateActiveCategory();
		}, {
			root: null,
			rootMargin: '-18% 0px -38% 0px',
			threshold: [0, 0.15, 0.4, 0.7]
		});

		sections.forEach(function (section) {
			observer.observe(section);
		});
	})();

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


  function labelOwlDots(e) {
    $(e.target).find('.owl-dots .owl-dot').each(function (i) {
      $(this).attr('aria-label', 'Go to slide ' + (i + 1));
    });
  }

	$('.loop').owlCarousel({
      center: true,
      items:1,
      loop:true,
      autoplay: true,
      nav: true,
      navElement: 'button type="button"',
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
  }).on('initialized.owl.carousel refreshed.owl.carousel', labelOwlDots);

  $('.tools-carousel').owlCarousel({
    items: 4,
    margin: 20,
    nav: true,
    navElement: 'button type="button"',
    dots: true,
    loop: true,
    autoplay: true,
    autoplayTimeout: 3000,
    autoplayHoverPause: true,
    responsive: {
      0: { items: 1 },
      600: { items: 2 },
      992: { items: 3 },
      1200: { items: 4 },
      1600: { items: 5 },
      1900: { items: 6 }
    }
  }).on('initialized.owl.carousel refreshed.owl.carousel', labelOwlDots);

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
        if(width < 992) {
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
      onScroll();
      
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

  function onScroll(){
      var scrollPos = $(document).scrollTop() + 125;
      var activeLink = null;

      $('.header-area .nav .nav-standard a').each(function () {
          var currLink = $(this);
          var hrefVal = currLink.attr('href');
          if (!hrefVal || hrefVal.indexOf('#') === -1) return;

          var hash = hrefVal.slice(hrefVal.indexOf('#'));
          var refElement = $(hash);
          if (refElement.length && refElement.offset() && refElement.offset().top <= scrollPos) {
              activeLink = currLink;
          }
      });

      // At the bottom of the document the footer can be visible before its
      // top crosses the usual scroll offset. Make Contact reliably active.
      if ($(window).scrollTop() + $(window).height() >= $(document).height() - 80) {
          var contactLink = $('.header-area .nav .nav-standard a[href$="#Contact"]');
          if (contactLink.length) {
              activeLink = contactLink.first();
          }
      }

      if (activeLink) {
          $('.header-area .nav .nav-standard a').removeClass('active');
          activeLink.addClass('active');
      }
  }

  // Desktop section rail: state is driven by IntersectionObserver, never by
  // scroll-position calculations. The skills band belongs to the About stop.
  (function () {
    function initSectionRail() {
      var rail = document.querySelector('.section-rail');
      if (!rail || !('IntersectionObserver' in window)) return;

      var links = Array.prototype.slice.call(rail.querySelectorAll('.section-rail-link'));
      var observedTargets = new Map();
      var sectionState = new Map();
      var reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
      var groupedTargets = { about: ['about', 'clients'] };

      function setActive(targetId) {
        links.forEach(function (link) {
          var isActive = link.dataset.railTarget === targetId;
          if (isActive) {
            link.setAttribute('aria-current', 'location');
          } else {
            link.removeAttribute('aria-current');
          }
        });
      }

      function selectMostVisible() {
        var activeTarget = '';
        var largestVisibleArea = 0;

        sectionState.forEach(function (visibleArea, observedElement) {
          if (visibleArea > largestVisibleArea) {
            largestVisibleArea = visibleArea;
            activeTarget = observedTargets.get(observedElement);
          }
        });

        if (activeTarget) setActive(activeTarget);
      }

      var sectionObserver = new IntersectionObserver(function (entries) {
        entries.forEach(function (entry) {
          // Intersection height reflects the portion occupying the focus area;
          // it is more reliable than a ratio when sections have very different heights.
          sectionState.set(entry.target, entry.isIntersecting ? entry.intersectionRect.height : 0);
        });
        selectMostVisible();
      }, {
        root: null,
        rootMargin: '-22% 0px -48% 0px',
        threshold: [0, 0.01, 0.1, 0.25, 0.5, 0.75, 1]
      });

      links.forEach(function (link) {
        var targetId = link.dataset.railTarget;
        var idsToObserve = groupedTargets[targetId] || [targetId];

        idsToObserve.forEach(function (observedId) {
          var section = document.getElementById(observedId);
          if (section) {
            observedTargets.set(section, targetId);
            sectionState.set(section, 0);
            sectionObserver.observe(section);
          }
        });

        link.addEventListener('click', function (event) {
          var section = document.getElementById(targetId);
          if (!section) return;

          event.preventDefault();
          setActive(targetId);
          section.scrollIntoView({
            behavior: reducedMotion ? 'auto' : 'smooth',
            block: 'start'
          });

          if (window.history && window.history.replaceState) {
            window.history.replaceState(null, '', '#' + targetId);
          }
        });
      });

      var hero = document.getElementById('top');
      if (hero) {
        var heroObserver = new IntersectionObserver(function (entries) {
          var heroEntry = entries[0];
          rail.classList.toggle('is-visible', heroEntry.intersectionRatio < 0.85);
        }, {
          threshold: [0, 0.1, 0.5, 0.85, 1]
        });
        heroObserver.observe(hero);
      } else {
        rail.classList.add('is-visible');
      }
    }

    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', initSectionRail);
    } else {
      initSectionRail();
    }
  }());

	// Page loading animation
	 $(window).on('load', function() {

        $('#js-preloader').addClass('loaded');

    });

	

	// Window Resize Mobile Menu Fix
  function mobileNav() {
    var width = $(window).width();
    $('.submenu').on('click', function() {
      if(width < 992) {
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
