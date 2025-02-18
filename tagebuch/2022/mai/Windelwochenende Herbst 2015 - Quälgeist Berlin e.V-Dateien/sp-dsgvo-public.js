

const CATEGORY_SLUG_STATISTICS = 'statistics';
const CATEGORY_SLUG_TARGETING = 'targeting';
const CATEGORY_SLUG_EMBEDDINGS = 'embeddings';
const CATEGORY_SLUG_LIVECHAT = 'live-chat';
const CATEGORY_SLUG_CHATBOTS = 'chat-bots';
const CATEGORY_SLUG_PLUGINS = 'plugins';
const CATEGORY_SLUG_MANDATORY = 'necessary';

(function ($) {

    $(document).ready(function () {


        // p912419
        // cookie advanced settings
        $(document).on('click', '#popup_accept_button', function (event) {
            event.preventDefault();

            var $selectedGoogleFonts = $("select[name='google-fonts'] option:selected").text();

            if ($selectedGoogleFonts === 'Yes') {
                var $googleFonts = $(document).find('link[data-href]');

                $.each($googleFonts, function () {
                    $(this).attr('href', $(this).attr('data-href')).removeAttr('data-href');
                });
            }
        });

        // check if notice is active and make body higher so that popup dont is in front of bottom links
        $(window).scroll(function() {
            if ($('#cookie-notice').is(":visible") == false) return;
            var height = parseInt($('#cookie-notice').css('height'));//+ 10;
            if($(window).scrollTop() + $(window).height() > $(document).height() - (height+20)) {
                $(document.body).css('padding-bottom', height+'px');
            } else
            {
                $(document.body).css('padding-bottom', 'inherit');
            }
        });

        var closeBtns = $('.sp-dsgvo-iframe-button-create');
        closeBtns.on('click tap touchstart', function (event) {

            event.preventDefault();
            event.stopPropagation();

            $("<iframe />", { src: "https://www.youtube.com/embed/ApvLgliq_lY?feature=oembed" }).appendTo("#iframeContainer");
        });

        var closeBtns = $('.sp-dsgvo-iframe-button-unblock');
        closeBtns.on('click tap touchstart', function (event) {

            event.preventDefault();
            event.stopPropagation();

            unblock($(this).attr('data-slug'));
        });

    });


})(jQuery);


(function ($) {
    'use strict';

    var scrollBar = null;
    var scrollBarMoreInformation = null;


    /**
     * Language switcher click (expand/collapse)
     */
    function preparePopupLangSwitcher() {
        var $active = $('.sp-dsgvo-lang-active'),
            $dropdown = $('.sp-dsgvo-lang-dropdown'),
            $switcher = $('.sp-dsgvo-popup-language-switcher');


        $active.on('click tap touchstart', function () {
            $dropdown.toggleClass('active');
        });

        $(document).on('click tap touchstart ', function (e) {
            if (!$switcher.is(e.target) && $switcher.has(e.target).length === 0) {
                $dropdown.removeClass('active');
            }
        });
    }

    /**
     * Adds Simplebar js scrollbar
     */
    function prepareScrolling() {
        var $content = $('#sp-dsgvo-privacy-content-category-content');

        if ($content.length > 0) {
            scrollBar = new SimpleBar($('#sp-dsgvo-privacy-content-category-content')[0], {
                autoHide: false
            });
        }
        var $moreInformation = $('.sp-dsgvo-popup-more-information-content');

        if ($moreInformation.length > 0) {
            scrollBarMoreInformation = new SimpleBar($('.sp-dsgvo-popup-more-information-content')[0], {
                autoHide: false
            });
        }

    }

    /**
     * Adds click event to terms links
     */
    function prepareTermsLinks() {
        var $links = $('.dsgvo-terms-toggle');

        $links.on('click tap touchstart', function (event) {
            event.preventDefault();
            event.stopPropagation();

            var $this = $(this),
                $content = $('#terms_content_' + $this.attr('data-id'));

            $content.addClass('active');
            if (scrollBar != null) scrollBar.recalculate();
            $(window).resize();
        });
    }

    function preparePopupShowLinks()
    {
        var $links = $('.sp-dsgvo-show-privacy-popup');

        $links.on('click tap touchstart', function (event) {
            event.preventDefault();
            event.stopPropagation();

            showPopup();
        });

        // links of privacy policy
        $links = $('.lwb-ppsp');

        $links.on('click tap touchstart', function (event) {
            event.preventDefault();
            event.stopPropagation();

            showPopup();
        });


        $links = $('.sp-dsgvo-navigate-privacy-policy');

        $links.on('click tap touchstart', function (event) {
            event.preventDefault();
            event.stopPropagation();

            window.location = spDsgvoGeneralConfig.privacyPolicyPageUrl;

        });

        // action for enabling embedded content
        $links = $('.sp-dsgvo-direct-enable-popup');

        $links.on('click tap touchstart', function (event) {
            event.preventDefault();
            event.stopPropagation();

            var slug = $(this).data('slug');
            if (slug == null || slug == '') return;

            enableEmbeddingByPlaceholderClick(slug);
        });
    }


    function preparePopupOverlay()
    {
        $('.sp-dsgvo-popup-overlay').on('click tap touchstart', function (event) {

            var clicked = $(event.target);  //get the element clicked

            if (clicked.is('.sp-dsgvo-privacy-popup') || clicked.parents().is('.sp-dsgvo-privacy-popup')) {
                return;  //click happened within the popup, do nothing here
            } else {  // click was outside the popup, so close it

                if (getAndValidateCookie() == false) // if no cookie exists (first visit) a click is like a dismiss all, otherwise a cancel/close
                {
                    handlePopupButtonAction('dismissAll');
                    closePopup(true);
                } else {
                    closePopup(false);
                }
            }
        });
    }

    function preparePopupActionButtons() {
        // x button
        var closeBtns = $('.sp-dsgvo-popup-close');
        closeBtns.on('click tap touchstart', function (event) {

            event.preventDefault();
            event.stopPropagation();

            if (getAndValidateCookie() == false) // if no cookie exists (first visit) a click is like a dismiss all, otherwise a cancel/close
            {
                handlePopupButtonAction('dismissAll');
                closePopup(true);
            } else {
                closePopup(false);
            }
        });

        // dismiss all button
        var dismissAllBtns = $('.sp-dsgvo-privacy-btn-accept-nothing');
        dismissAllBtns.on('click tap touchstart', function (event) {

            event.preventDefault();
            event.stopPropagation();

            handlePopupButtonAction('dismissAll');
            closePopup(false);
        });

        // accept selected button
        var acceptSelectedBtns = $('.sp-dsgvo-privacy-btn-accept-selection');
        acceptSelectedBtns.on('click tap touchstart', function (event) {

            event.preventDefault();
            event.stopPropagation();

            handlePopupButtonAction('acceptSelected');
            closePopup(false);
        });

        // accept all button
        var acceptAllBtns = $('.sp-dsgvo-privacy-btn-accept-all');
        acceptAllBtns.on('click tap touchstart', function (event) {

            event.preventDefault();
            event.stopPropagation();

            handlePopupButtonAction('acceptAll');

            closePopup(false);
        });
    }

    function preparePopupSwitches()
    {
        // uncheck all
        $('.sp-dsgvo-switch-integration').not(":disabled").prop('checked', false);

        $('.sp-dsgvo-switch-integration').change(function () {
            checkForIntegrationModificationsAndSetColorToButtons();
        });

        var enabledIntegrations = getEnabledIntegrationsFromCookie();

        enabledIntegrations.forEach(function(integration) {

            // check if the script container exists. if not create it to add script afterwards
            $('#sp-dsgvo-switch-integration-'+integration).prop('checked', true);

        });
    }

    function checkForIntegrationModificationsAndSetColorToButtons()
    {
        var array1 = getEnabledIntegrationsFromCookie();
        var array2 = $('.sp-dsgvo-switch-integration:checked').map(function(){
            return $(this).data('slug');
        }).get();

        var equal = array1.length === array2.length && array1.every(function(value, index) { return value === array2[index]});

        if (equal == false)
        {
            $('.sp-dsgvo-privacy-btn-accept-selection').addClass('green');
            $('.sp-dsgvo-privacy-btn-accept-selection').removeClass('grey');
        } else
        {
            $('.sp-dsgvo-privacy-btn-accept-selection').removeClass('green');
            $('.sp-dsgvo-privacy-btn-accept-selection').addClass('grey');
        }
    }

    function closePopup(closedOnFirstVisit) {
        var $overlay = $('.sp-dsgvo-popup-overlay');
        if ($overlay.length > 0) {
            $overlay.fadeOut();
            $overlay.addClass('sp-dsgvo-overlay-hidden');

            if (spDsgvoGeneralConfig.showNoticeOnClose == 1 && closedOnFirstVisit) {
                showNotice();
            }
        }
    }

    function showPopup() {

        preparePopupSwitches();

        var $overlay = $('.sp-dsgvo-popup-overlay');

        if ($overlay.length > 0) {
            closeNotice();
            $overlay.fadeIn();
            $overlay.removeClass('sp-dsgvo-overlay-hidden');

        }
    }

    function showNotice()
    {
        var cnDomNode = $('#cookie-notice');


        if (spDsgvoGeneralConfig.noticeHideEffect === 'fade') {
            cnDomNode.fadeIn();
        } else if (spDsgvoGeneralConfig.noticeHideEffect === 'slide') {
            cnDomNode.slideDown();
        } else {
            cnDomNode.css('display', 'flex');
        }

        $('body').addClass('cookies-not-accepted');
    }

    function closeNotice()
    {
        var cnDomNode = $('#cookie-notice');
        if (cnDomNode.is(":visible") == false) return;

        if (spDsgvoGeneralConfig.noticeHideEffect === 'fade') {
            cnDomNode.fadeOut(function () {
                $('#cookie-notice').hide();
                $('#cookie-notice-blocker').hide();
                $('body').removeClass('cookies-not-accepted');
            });
        } else if (spDsgvoGeneralConfig.noticeHideEffect === 'slide') {
            cnDomNode.slideUp(function () {
                $('#cookie-notice').hide();
                $('#cookie-notice-blocker').hide();
                $('body').removeClass('cookies-not-accepted');
            });
        } else {
            $('#cookie-notice').hide();
            $('#cookie-notice-blocker').hide();
            $('body').removeClass('cookies-not-accepted');
        }
    }

    function checkCookieAndShowPopupOrNoticeIfNeeded()
    {
        if (spDsgvoIntegrationConfig == null) return;

        if (getNonMandatoryIntegrations(spDsgvoIntegrationConfig).length == 0 && spDsgvoGeneralConfig.forceCookieInfo == 0) return;

        if (spDsgvoGeneralConfig.currentPageId == spDsgvoGeneralConfig.privacyPolicyPageId ||
            spDsgvoGeneralConfig.currentPageId == spDsgvoGeneralConfig.imprintPageId)
        {
            // dont show popup or notice at imprint or policy page
            return;
        }

        if (getAndValidateCookie() == false)
        {
            if (spDsgvoGeneralConfig.initialDisplayType == 'cookie_notice') {
                showNotice();
            } else if (spDsgvoGeneralConfig.initialDisplayType == 'policy_popup') {
                showPopup();
            }
        }
    }

    function showMoreInformationPopup(title, slug, locale) {

        $('#sp-dsgvo-popup-more-information-title').html(title);
        $('#sp-dsgvo-popup-more-information-progress').show();

        $('.sp-dsgvo-privacy-popup-title-general').hide();
        $('#sp-dsgvo-privacy-content-category-content').hide();
        $('#sp-dsgvo-privacy-footer').hide();
        $('.sp-dsgvo-header-description-text').hide();

        $('#sp-dsgvo-more-information-switch-cb').attr('data-slug', slug);
        $('#sp-dsgvo-more-information-switch-cb').prop('checked', $('#sp-dsgvo-switch-integration-' + slug).prop('checked'));
        $('#sp-dsgvo-more-information-switch-cb').prop('disabled', $('#sp-dsgvo-switch-integration-' + slug).prop('disabled'));
        $('.sp-dsgvo-privacy-popup-title-details').show();
        $('#sp-dsgvo-popup-more-information').show();


        var integrationObject = getIntegrationConfigBySlug(slug);

        $.get(spDsgvoGeneralConfig.wpJsonUrl +'lwTextEndpoint', {
                //action: 'legal-web-text-action',
                slug: slug,
                textId: 'popup',
                locale: locale,
                includeTagManager: integrationObject.usedTagmanager
            },
            function (data) {


                $('#sp-dsgvo-popup-more-information-title').html(title);
                $('#sp-dsgvo-popup-more-information-content').html(data);


                $('#sp-dsgvo-popup-more-information-progress').hide();
                $('.sp-dsgvo-privacy-popup-title-details').show();
                $('#sp-dsgvo-popup-more-information').show();


            }).fail(function() {
            hideMoreInformationPopup();
        })
    }

    function hideMoreInformationPopup() {


        $('#sp-dsgvo-popup-more-information').hide();
        $('.sp-dsgvo-privacy-popup-title-details').hide();
        $('#sp-dsgvo-popup-more-information-progress').hide();

        $('#sp-dsgvo-popup-more-information-content').html('');
        $('#sp-dsgvo-more-information-switch-cb').attr('data-slug', '');
        $('#sp-dsgvo-more-information-switch-cb').prop('checked', false);

        $('.sp-dsgvo-privacy-popup-title-general').show();
        $('.sp-dsgvo-header-description-text').show();
        $('#sp-dsgvo-privacy-content-category-content').show();
        $('#sp-dsgvo-privacy-footer').show();
    }

    function prepareMoreInformationPopup() {
        var $links = $('.sp-dsgvo-more-information-link');

        $links.on('click tap touchstart', function (event) {

            event.preventDefault();
            event.stopPropagation();

            var $this = $(this);
            var title = $this.attr('data-title');
            var slug = $this.attr('data-slug');


            showMoreInformationPopup(title, slug, spDsgvoGeneralConfig.locale);

        });

        var closeBtns = $('.sp-dsgvo-popup-more-information-close');
        closeBtns.on('click tap touchstart', function (event) {

            event.preventDefault();
            event.stopPropagation();

            hideMoreInformationPopup();
        });

        // set the handler for the more information cb that the outside sb also gets set
        $('#sp-dsgvo-more-information-switch-cb').change(function () {

            var $this = $(this);
            var slug = $this.attr('data-slug');
            if (slug == '') return;
            if ($(this).prop('disabled')) return;
            $('#sp-dsgvo-switch-integration-' + slug).prop('checked', $this.prop('checked'));

            checkForIntegrationModificationsAndSetColorToButtons();
        });
    }

    function preparePopupGroupSwitches() {
        $('input[name="sp-dsgvo-switch-category"]').change(function () {

            var $this = $(this);
            var slug = $this.attr('data-slug');

            // get all sp-dsgvo-switch-integration with slug and set same check value
            $('input[data-category="' + slug + '"]').each(function () {
                if ($(this).prop('disabled')) return;
                var category = $(this).attr('data-category');
                $(this).prop('checked', $('#sp-dsgvo-switch-category-' + category).prop('checked'));
            });

            checkForIntegrationModificationsAndSetColorToButtons();
        });
    }

    function prepareNotice()
    {
        // sometimes wp admin bar sets a margin top. if its greater 0 set it to the notice position
        //var bodyMt = $('body,html').css('margin-top');
        //$('.cn-bottom').css('bottom', bodyMt);

        $('#cn-btn-settings').on('click tap touchstart', function (event) {

            event.preventDefault();
            event.stopPropagation();

            closeNotice();
            showPopup();
        });

    }

    function handlePopupButtonAction(action) {
        if (action == null || action == '') return;


        var allntegrationSlugs = spDsgvoGeneralConfig.allIntegrationSlugs;
        var selectedSwitches = $('.sp-dsgvo-switch-integration:checkbox:checked');
        var checkedIntegrationSlugs = [];

        switch (action) {
            case 'acceptAll':
                checkedIntegrationSlugs = allntegrationSlugs;
                break;
            case 'acceptSelected':
                $(".sp-dsgvo-switch-integration:checkbox:checked").each(function () {
                    checkedIntegrationSlugs.push($(this).data("slug"));
                });
                break;
            case 'dismissAll':
                checkedIntegrationSlugs = []; // reset them
                break;
        }

        var enabledIntegrationsBeforeClosing = getEnabledIntegrationsFromCookie();

        // add gtag manager if used by integration
        var gtmNeeded = 0;
        var mtmNeeded = 0;
        checkedIntegrationSlugs.forEach(function(integration)
        {
            var integrationObject = getIntegrationConfigBySlug(integration);
            if (integrationObject == null) return;

            if (integrationObject.usedTagmanager == 'google-analytics')
            {
                gtmNeeded++;
            }
            if (integrationObject.usedTagmanager == 'matomo-analytics')
            {
                mtmNeeded++;
            }
        });
        if (gtmNeeded > 0 ) checkedIntegrationSlugs.push('google-tagmanager');
        if (mtmNeeded > 0 ) checkedIntegrationSlugs.push('matomo-tagmanager');

        refreshCookie(checkedIntegrationSlugs);
        enableIntegrationsAccordingToCookie();
        removeCookiesOfDisabledIntegrations(enabledIntegrationsBeforeClosing);
    }

    function refreshCookie(checkedIntegrationSlugs) {

        var lifeTime = 0;
        if (checkedIntegrationSlugs != null && checkedIntegrationSlugs.length > 0)
        {
            lifeTime = spDsgvoGeneralConfig.cookieLifeTime;
        } else
        {
            lifeTime = spDsgvoGeneralConfig.cookieLifeTimeDismiss;
        }

        var cookieData = {};
        cookieData.version = spDsgvoGeneralConfig.cookieVersion;
        cookieData.lifeTime = lifeTime;
        cookieData.integrations = checkedIntegrationSlugs;//
        cookieData.lastChangeOn = new Date().getTime();

        var flatData = encodeURIComponent(JSON.stringify(cookieData));
        var d = new Date();
        d.setTime(d.getTime() + parseInt(lifeTime) * 1000);
        var expires = "expires=" + d.toUTCString();
        document.cookie = spDsgvoGeneralConfig.cookieName + "=" + flatData + ";" + expires + ";path=/";

    }

    function isGtagMangerIsActive()
    {
        return window.google_tag_manager != null;
    }

    function isMtagMangerIsActive()
    {
        return window._mtm != null;
    }

    function enableIntegrationsAccordingToCookie() {

        var enabledIntegrations = getEnabledIntegrationsFromCookie();


        // first check if one needs gtag manager and enable it if needed
        var gtmNeeded = 0;
        var mtmNeeded = 0;
        enabledIntegrations.forEach(function(integration)
        {
            var integrationObject = getIntegrationConfigBySlug(integration);
            if (integrationObject == null) return;
            if (integrationObject.usedTagmanager == 'google-tagmanager')
            {
                gtmNeeded++;
            }

            if (integrationObject.usedTagmanager == 'matomo-tagmanager')
            {
                mtmNeeded++;
            }
        });

        if (gtmNeeded > 0 && isGtagMangerIsActive() == false)
        {
            var integrationObject = getIntegrationConfigBySlug('google-tagmanager');
            if (integrationObject == null) return;
            try {
                $('head').append(atob(integrationObject.jsCode));
            } catch (e) {
                console.log('could not activate ' + integrationObject.slug);
            }
        }

        if (mtmNeeded > 0 && isMtagMangerIsActive() == false)
        {
            var integrationObject = getIntegrationConfigBySlug('matomo-tagmanager');
            if (integrationObject == null) return;
            try {
                $('head').append(atob(integrationObject.jsCode));
            } catch (e) {
                console.log('could not activate ' + integrationObject.slug);
            }
        }

        // enable all integrations which are opted in
        enabledIntegrations.forEach(function(integrationSlug)
        {

            // exclude tagmanger now because it was enabled before
            if (integrationSlug == 'google-tagmanager') return;
            if (integrationSlug == 'matomo-tagmanager') return;

            var integrationObject = getIntegrationConfigBySlug(integrationSlug);
            if (integrationObject == null) return;

            // check type of integration (embedding, stats,..) and do correct action

            switch (integrationObject.category) {
                case CATEGORY_SLUG_STATISTICS: enableJsIntegration(integrationObject); break;
                case CATEGORY_SLUG_TARGETING:  enableJsIntegration(integrationObject); break;
                case CATEGORY_SLUG_CHATBOTS:  enableJsIntegration(integrationObject); break;
                case CATEGORY_SLUG_EMBEDDINGS: enableEmbeddingIntegration(integrationObject); break;
            }

            var optinEvent = new CustomEvent(
                "lw-optinout",
                {
                    detail: {
                        integrationId: integrationObject.slug,
                        integrationCategory: integrationObject.category,
                        integrationCode: integrationObject.jsCode,
                        mode: 'optin',
                        time: new Date(),
                    },
                    bubbles: true,
                    cancelable: false
                }
            );
            document.querySelector('.sp-dsgvo-privacy-popup').dispatchEvent(optinEvent);


        });
    }

    function enableJsIntegration(integrationObject)
    {
        if (integrationObject.insertLocation == 'head')
        {
            // check if head contains the script, if not, add it
            var pos = $("head").html().indexOf('sp-dsgvo-script-container-' + integrationObject.slug);
            var lastPos = $("head").html().lastIndexOf('sp-dsgvo-script-container-' + integrationObject.slug);
            if (pos == lastPos)
            {
                try {
                    $('head').append(atob(integrationObject.jsCode));
                } catch (e) {
                    console.log('could not activate ' + integrationObject.slug);
                }
            }
        } else {
            // check if the script container exists. if not create it to add script afterwards
            var scriptContainer = $('.sp-dsgvo-script-container-' + integrationObject.slug);
            var found = scriptContainer.length;

            if (found == false) {

                scriptContainer = $('<div/>', {
                    // id: 'sp-dsgvo-script-container-' + integration,
                    "class": 'sp-dsgvo-script-container sp-dsgvo-script-container-' + integrationObject.slug,
                }).appendTo(integrationObject.insertLocation);
                found = true;

            }

            // if found and empty add js code to the container
            var isEmpty = $.trim(scriptContainer.html()) == '';
            if (found && isEmpty) {
                try {
                    scriptContainer.append(atob(integrationObject.jsCode));
                } catch (e) {
                    console.log('could not activate ' + integrationObject.slug);
                }
            }
        }
    }

    function enableEmbeddingIntegration(integrationObject)
    {
        var allContainersOfCurrentSlug = $('.sp-dsgvo-embedding-'+ integrationObject.slug);

        // find all containers of current enabled embedding
        allContainersOfCurrentSlug.each(function()
        {
            var slugContainer = $(this);
            // get base64 encoded content, decode it, remove placeholder and insert it into dom
            var base64EncContent = slugContainer.find('.sp-dsgvo-hidden-embedding-content');
            if (base64EncContent == null || base64EncContent.html() == null || base64EncContent.html() == '') return;

            try {

                var decodedContent = atob(base64EncContent.html());
                var txt = document.createElement("textarea");
                txt.innerHTML = decodedContent;
                var htmlContentOnly = $.parseHTML(txt.value);

                slugContainer.empty();
                slugContainer.append((htmlContentOnly));

                var parsedDocument = new DOMParser().parseFromString(decodedContent, "text/html");
                var scripts = parsedDocument.getElementsByTagName('script');

                if (scripts.length > 0) {



                    // iterate over all script tags and create a duplicate tags for each

                    for (var i = 0; i < scripts.length; i++) {
                        var s = document.createElement('script');
                        s.innerHTML = scripts[i].innerHTML;
                        s.async = scripts[i].async;
                        if (scripts[i].src != null && scripts[i].src != '') s.src = scripts[i].src;
                        if (scripts[i].type != null && scripts[i].type != '') s.type = scripts[i].type;
                        // add the new node to the page
                        this.appendChild(s);
                    }
                }
            }
            catch (e) {
                console.log('could not enable embedding: '+ integrationObject.slug);
            }


        });


    }

    function enableEmbeddingByPlaceholderClick(embeddingSlug)
    {
        var currentConfig = getEnabledIntegrationsFromCookie();

        var integrationObject = getIntegrationConfigBySlug(embeddingSlug);
        if (integrationObject == null) return;

        enableEmbeddingIntegration(integrationObject);
        currentConfig.push(embeddingSlug);

        refreshCookie(currentConfig);

        var optinEvent = new CustomEvent(
            "lw-optinout",
            {
                detail: {
                    integrationId: integrationObject.slug,
                    integrationCategory: integrationObject.category,
                    integrationCode: integrationObject.jsCode,
                    mode: 'optin',
                    time: new Date(),
                },
                bubbles: true,
                cancelable: false
            }
        );
        document.querySelector('.sp-dsgvo-privacy-popup').dispatchEvent(optinEvent);
    }

    function removeCookiesOfDisabledIntegrations(enabledIntegrationsBeforeClosing)
    {
        var reloadNeeded = 0;
        var enabledIntegrations = getEnabledIntegrationsFromCookie();

        // it nothing was enabled and all gets dismissed its not needed to to anything
        // could happen on first visit when dismiss all
        if (enabledIntegrations.length == 0 && enabledIntegrationsBeforeClosing.length == 0) return;

        // if nothing is enabled, remove all
        if (enabledIntegrations == null || enabledIntegrations == '' || enabledIntegrations == '' || Array.isArray(enabledIntegrations) == false) {
            $('.sp-dsgvo-script-container').each(function () {

                $(this).empty();
            });


            spDsgvoIntegrationConfig.forEach(function(integrationConfig) {

                // remove cookies of the integration
                var cookiesToDeleteString = integrationConfig.cookieNames;
                if (cookiesToDeleteString != null || cookiesToDeleteString != '')
                {
                    var cookieNames = cookiesToDeleteString.split(';');
                    if (cookieNames != null && cookieNames.length > 0)
                    {
                        cookieNames.forEach(function(cookieName) {
                            deleteCookieByName(cookieName);
                        });

                    }
                }

                // check if it was enabled before
                if (enabledIntegrationsBeforeClosing.includes(integrationConfig.slug)) {

                    var optoutEvent = new CustomEvent(
                        "lw-optinout",
                        {
                            detail: {
                                integrationId: integrationConfig.slug,
                                integrationCategory: integrationConfig.category,
                                integrationCode: integrationConfig.jsCode,
                                mode: 'optout',
                                time: new Date(),
                            },
                            bubbles: true,
                            cancelable: false
                        }
                    );
                    document.querySelector('.sp-dsgvo-privacy-popup').dispatchEvent(optoutEvent);
                }

            });

            // safe mode because scripts still could run in browser
            location.reload();

            return;
        }

        spDsgvoIntegrationConfig.forEach(function(integrationConfig) {

            if(enabledIntegrations.includes(integrationConfig.slug) == false) {

                // check if it was enabled before
                if (enabledIntegrationsBeforeClosing.includes(integrationConfig.slug)) reloadNeeded++;

                var optoutEvent = new CustomEvent(
                    "lw-optinout",
                    {
                        detail: {
                            integrationId: integrationConfig.slug,
                            integrationCategory: integrationConfig.category,
                            integrationCode: integrationConfig.jsCode,
                            mode: 'optout',
                            time: new Date(),
                        },
                        bubbles: true,
                        cancelable: false
                    }
                );
                document.querySelector('.sp-dsgvo-privacy-popup').dispatchEvent(optoutEvent);

                /* currently not needed because we remove it in reload because otherwise the script cant be removed from js vm
                //remove script of the integration
                var scriptContainer =  $('#sp-dsgvo-script-container-'+integrationConfig.slug);
                var found = scriptContainer.length;

                if (found == false)
                {
                    // if not found also check in head
                    var children = $('head').find('div#sp-dsgvo-script-container-' + integrationConfig.slug);
                    if (children.length > 0) {
                        scriptContainer = children[0];
                        found = true;
                    }
                }

                if (found)
                {
                    scriptContainer.empty();
                    scriptContainer.each(function () {
                        $(this).empty();
                    });
                }
                */


                // remove cookies of the integration
                var cookiesToDeleteString = integrationConfig.cookieNames;
                if (cookiesToDeleteString != null || cookiesToDeleteString != '')
                {
                    var cookieNames = cookiesToDeleteString.split(';');
                    if (cookieNames != null && cookieNames.length > 0)
                    {
                        cookieNames.forEach(function(cookieName) {
                            deleteCookieByName(cookieName);
                        });

                    }
                }
            }

        });

        if (reloadNeeded > 0)
        {
            // safe mode because scripts still could run in browser
            location.reload();
        }
    }

    function getCookie(cname) {
        var name = cname + "=";
        var decodedCookie = decodeURIComponent(document.cookie);
        var ca = decodedCookie.split(';');
        for (var i = 0; i < ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }

    function validateCookieData(cookie)
    {
        if (cookie == null || cookie == '') return false;

        var cookieData = {};
        try {
            cookieData = JSON.parse(decodeURIComponent(cookie));
        } catch (e) {
            return false;
        }

        if (cookieData.version < spDsgvoGeneralConfig.cookieVersion)
        {
            return false;
        }

        return true;
    }

    function getAndValidateCookie()
    {
        var cookie = getCookie(spDsgvoGeneralConfig.cookieName);
        return validateCookieData(cookie);
    }

    function getEnabledIntegrationsFromCookie() {
        var enabledIntegrations = [];
        var cookie = getCookie(spDsgvoGeneralConfig.cookieName);
        if (cookie != '')
        {
            try {
                var objectData = JSON.parse(decodeURIComponent(cookie));
                enabledIntegrations = objectData.integrations;
            } catch (e) {
                enabledIntegrations = [];
            }
        }

        return enabledIntegrations;
    }

    function deleteCookieByName(pattern)
    {
        if (pattern == '') return;
        var matcher = new RegExp("^"+pattern, "g");

        if ((matcher).test(document.cookie) == false) return;

        // Get an array of all cookie names (the regex matches what we don't want)
        var cookieNames = document.cookie.split(/=[^;]*(?:;\s*|$)/);
        // Remove any that match the pattern
        for (var i = 0; i < cookieNames.length; i++) {
            if (matcher.test(cookieNames[i])) {
                document.cookie = cookieNames[i] + '=; expires=Thu, 01 Jan 1970 00:00:00 GMT;'; // path=' + path;
            }
        }
    }

    function getIntegrationConfigBySlug(slug)
    {
        /*
        var integrationObject = spDsgvoIntegrationConfig.filter(obj => {
            return obj.slug === slug;
        });
*/
        var integrationObject = null;
        spDsgvoIntegrationConfig.forEach(function(integration) {

            if (integration.slug == slug)
            {
                integrationObject = integration
                return;
            }
        });

        return integrationObject;
    }

    function getNonMandatoryIntegrations(integrationsArray)
    {
        var result = [];
        integrationsArray.forEach(function(integration) {

            if (integration.category != CATEGORY_SLUG_MANDATORY)
            {
                result.push(integration);
            }
        });

        return result;
    }

    function isIntegrationAllowedByCookieSettings(slug)
    {
        var found = false;
        var enabledIntegrations = getEnabledIntegrationsFromCookie();

        enabledIntegrations.forEach(function(integration) {

           if (integration == slug)
           {
               found = true;
               return;
           }
        });

        return found;
    }

    $(document).ready(function () {
        enableIntegrationsAccordingToCookie();

        preparePopupLangSwitcher();
        prepareMoreInformationPopup();
        prepareTermsLinks();
        preparePopupActionButtons();
        preparePopupGroupSwitches();
        preparePopupSwitches();

        prepareScrolling();
        prepareNotice();
        preparePopupShowLinks();
        preparePopupOverlay();

        checkCookieAndShowPopupOrNoticeIfNeeded();

    });

    // DYNAMIC EMBEDDINGS
    const TYPE_ATTRIBUTE = 'iframe/blocked'
    const backupScripts = {
        blacklisted: []
    }

    function isOnBlacklist(src, nodeType)
    {
        var affectedIntegration = getIntegrationByNodeSrc(src.toLowerCase());

        if (affectedIntegration == null) return false;
        var isBlacklistedByCookie = isIntegrationAllowedByCookieSettings(affectedIntegration.slug) == false;

        return isBlacklistedByCookie;
    }

    function getIntegrationByNodeSrc(src)
    {
        if (spDsgvoIntegrationConfig == null) return null;

        var affectedIntegration = null;
        var found = false;
        // iterate over all integrations and check if root domain is one of such an integration
        spDsgvoIntegrationConfig.forEach(function(integrationConfig) {

            if (found) return;

            var hosts = integrationConfig.hosts;
            if (hosts != null && hosts != '')
            {
                var hostNames = hosts.split(';');
                if (hostNames != null && hostNames.length > 0)
                {
                    hostNames.forEach(function(hostName) {
                        if (src.indexOf(hostName.toLowerCase()) >= 0)
                        {
                            found = true;
                            return;
                        }
                    });

                    if (found) {
                        affectedIntegration = integrationConfig;
                        return;
                    }
                }
            }

        });

        return affectedIntegration;
    }

    // config object
    const config = {
        characterData: true,
        characterDataOldValue: true,
        childList: true,
        subtree: true
    };

    // subscriber function
    function subscriber(mutations) {
        //console.log('subscriber');
        for (let k = 0; k < mutations.length; k++) {
            const addedNodes  = mutations[k].addedNodes;
            for(let i = 0; i < addedNodes.length; i++) {
                const node = addedNodes[i];
                // For each added script tag
                if(node.nodeType === 1 && node.tagName === 'IFRAME') {
                    const src = node.src;
                    const type = node.type;
                    // If the src is inside the blacklist and is not inside the whitelist
                    if(isOnBlacklist(src, type)) {
                        // We backup a copy of the script node
                        backupScripts.blacklisted.push(node.cloneNode());

                        // Blocks inline script execution in Safari & Chrome
                        node.type = TYPE_ATTRIBUTE;

                        var placeholderNodeHtml = getPlaceholderInsteadOfNode(node);


                        // Firefox has this additional event which prevents scripts from beeing executed
                        const beforeScriptExecuteListener = function (event) {
                            // Prevent only marked scripts from executing
                            if(node.getAttribute('type') === TYPE_ATTRIBUTE)
                                event.preventDefault();
                            node.removeEventListener('beforescriptexecute', beforeScriptExecuteListener)
                        };
                        node.addEventListener('beforescriptexecute', beforeScriptExecuteListener)

                        // backup parent
                        var parentNode =  node.parentElement;
                        // Remove the node from the DOM
                        node.parentElement && node.parentElement.removeChild(node);

                        var temp = document.createElement('div');
                        temp.innerHTML = placeholderNodeHtml;
                        parentNode.appendChild(temp);
                        addEventHandlerToUnblockButton();

                    }
                }
            }
        }
    }


    function getPlaceholderInsteadOfNode(node)
    {
        var nodeHtml = getNodeAsHtmlString(node);
        var integration = getIntegrationByNodeSrc(node.src);
        var encodedHtml = btoa(nodeHtml);

        var placeholderHtml = integration.placeholder;
        placeholderHtml = placeholderHtml.replace('{encodedContent}',encodedHtml);

       return placeholderHtml;
    }

    function getNodeAsHtmlString(node)
    {
        var wrap = document.createElement('div');
        wrap.appendChild(node.cloneNode(true));
        return wrap.innerHTML;
    }

    function addEventHandlerToUnblockButton()
    {
        // action for enabling embedded content

        $('.sp-dsgvo-direct-enable-popup').on('click tap touchstart', function (event) {
            event.preventDefault();
            event.stopPropagation();

            var slug = $(this).data('slug');
            if (slug == null || slug == '') return;

            enableEmbeddingByPlaceholderClick(slug);
        });
    }

    // instantiating observer
    const observer = new MutationObserver(subscriber);

// observing target
    var target = document.documentElement || document.body;
    if (spDsgvoGeneralConfig.clientSideBlocking == '1') {
        observer.observe(target, config);
    }

})(jQuery);

