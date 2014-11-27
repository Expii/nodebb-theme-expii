<!DOCTYPE html>
<html>
<head>
	<title>{browserTitle}</title>
	<!-- BEGIN metaTags -->
	{function.buildMetaTag}
	<!-- END metaTags -->
	<link rel="stylesheet" type="text/css" href="{relative_path}/stylesheet.css?{css-buster}" />
	<!-- BEGIN linkTags -->
	<link<!-- IF linkTags.link --> link="{linkTags.link}"<!-- ENDIF linkTags.link --><!-- IF linkTags.rel --> rel="{linkTags.rel}"<!-- ENDIF linkTags.rel --><!-- IF linkTags.type --> type="{linkTags.type}"<!-- ENDIF linkTags.type --><!-- IF linkTags.href --> href="{linkTags.href}"<!-- ENDIF linkTags.href --> />
	<!-- END linkTags -->

	<!--[if lt IE 9]>
  		<script src="//cdnjs.cloudflare.com/ajax/libs/es5-shim/2.3.0/es5-shim.min.js"></script>
  		<script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.js"></script>
  		<script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.js"></script>
  		<script>__lt_ie_9__ = 1;</script>
	<![endif]-->

	<script>
		var RELATIVE_PATH = "{relative_path}";
	</script>
	<script src="{relative_path}/nodebb.min.js?{script-buster}"></script>
	<script>
		require.config({
			baseUrl: "{relative_path}/src/modules",
			waitSeconds: 3,
			urlArgs: "{cache-buster}",
			paths: {
				'forum': '../forum',
				'vendor': '../../vendor'
			}
		});
	</script>

	<!-- Start segment from Po: auto-stick header after hero image -->
        <script>
          function stickyMenuHandler() {
              if ($("#header-menu-detector").length > 0) {
                  var pxBelow = $("#header-menu-detector").first().offset().top - $(window).scrollTop();
                  if (pxBelow < 0) {
                      $("#header-menu-spacer").addClass('header-menu-space');
                      $("#header-menu").addClass('navbar-fixed-top');
                      $(".expii-masthead-logo").addClass('expii-masthead-logo-visible');
                  }
                  else {
                      $("#header-menu-spacer").removeClass('header-menu-space');
                      $("#header-menu").removeClass('navbar-fixed-top');
                      $(".expii-masthead-logo").removeClass('expii-masthead-logo-visible');
                  }
              }
          }

          // hack: if there are too few scroll handlers, push us on
          // (it seems like the scroll handlers are constantly reset during navigation)
          function addStickyMenuHandler() {
            if ($._data(window).events.scroll === undefined ||
                    $._data(window).events.scroll.length <= 4) {
                  $(window).on('scroll', stickyMenuHandler);
            }
            // also run it now anyway. Otherwise, sometimes when you go
            // into a page which has no scrolling, the navbar can be stuck
            // to the top.
            stickyMenuHandler();
            setTimeout(addStickyMenuHandler, 500);
          }
          addStickyMenuHandler();
	</script>

        <!-- Exo 2 font for tiny portion of header -->
	<link href='http://fonts.googleapis.com/css?family=Exo+2:400' rel='stylesheet' type='text/css' />

	<!-- End segment from Po: auto-stick header after hero image -->

	<!-- IF useCustomJS -->
	{customJS}
	<!-- ENDIF useCustomJS -->
	<!-- IF useCustomCSS -->
	<style type="text/css">{customCSS}</style>
	<!-- ENDIF useCustomCSS -->

</head>

<body>
  <!-- Start segment from Po: Hero image above header -->
	<div id="site-header-big-picture">
	  <div class="site-header-big-left">
	    <div class="site-header-big-left-expii">
		  <a href="https://www.expii.com"><div class="expii-full"></div></a>
	    </div>
	    <div class="site-header-big-left-concourse">
		  <a href="/"><div class="expii-full"></div></a>
	    </div>
		<img src="/uploads/main-header-concourse-left.png" width="100%">
	  </div>
	  <div class="site-header-big-right">
	    <img src="/uploads/main-header-concourse-right.jpg" width="100%">
	  </div>
	  <div style="clear:both;"></div>
	</div>

	<!-- this detects when the masthead should fix -->
	<div id="header-menu-detector"></div>

        <!-- Here's their old navbar -->
        <!--
	<div class="navbar navbar-default navbar-fixed-top header" role="navigation" id="header-menu">
        -->
        <!-- Here's Po's new navbar styling -->
	<div class="navbar navbar-inverse header" role="navigation" id="header-menu">
        <!-- Po also moved the loading bar below the navbar -->
		<div class="container">
			<!-- IMPORT partials/menu.tpl -->
		</div>
		<div class="loading-bar"></div>
	</div>
        <!-- This next line is new from Po too -->
	<div id="header-menu-spacer" class="header-menu-spacer"></div>

        <!-- End segment from Po: Hero image above header -->

	<div class="container" id="content">
	<!-- IMPORT partials/noscript/warning.tpl -->
