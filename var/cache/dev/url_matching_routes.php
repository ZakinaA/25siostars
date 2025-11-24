<?php

/**
 * This file has been auto-generated
 * by the Symfony Routing Component.
 */

return [
    false, // $matchHost
    [ // $staticRoutes
        '/_wdt/styles' => [[['_route' => '_wdt_stylesheet', '_controller' => 'web_profiler.controller.profiler::toolbarStylesheetAction'], null, null, null, false, false, null]],
        '/_profiler' => [[['_route' => '_profiler_home', '_controller' => 'web_profiler.controller.profiler::homeAction'], null, null, null, true, false, null]],
        '/_profiler/search' => [[['_route' => '_profiler_search', '_controller' => 'web_profiler.controller.profiler::searchAction'], null, null, null, false, false, null]],
        '/_profiler/search_bar' => [[['_route' => '_profiler_search_bar', '_controller' => 'web_profiler.controller.profiler::searchBarAction'], null, null, null, false, false, null]],
        '/_profiler/phpinfo' => [[['_route' => '_profiler_phpinfo', '_controller' => 'web_profiler.controller.profiler::phpinfoAction'], null, null, null, false, false, null]],
        '/_profiler/xdebug' => [[['_route' => '_profiler_xdebug', '_controller' => 'web_profiler.controller.profiler::xdebugAction'], null, null, null, false, false, null]],
        '/_profiler/open' => [[['_route' => '_profiler_open_file', '_controller' => 'web_profiler.controller.profiler::openAction'], null, null, null, false, false, null]],
        '/accueil' => [[['_route' => 'app_accueil_index', '_controller' => 'App\\Controller\\AccueilController::index'], null, ['GET' => 0], null, false, false, null]],
        '/accueil/new' => [[['_route' => 'app_accueil_new', '_controller' => 'App\\Controller\\AccueilController::new'], null, ['GET' => 0, 'POST' => 1], null, false, false, null]],
        '/cours' => [[['_route' => 'app_cours_index', '_controller' => 'App\\Controller\\CoursController::index'], null, ['GET' => 0], null, false, false, null]],
        '/cours/new' => [[['_route' => 'app_cours_new', '_controller' => 'App\\Controller\\CoursController::new'], null, ['GET' => 0, 'POST' => 1], null, false, false, null]],
        '/eleve' => [[['_route' => 'app_eleve_index', '_controller' => 'App\\Controller\\EleveController::index'], null, ['GET' => 0], null, false, false, null]],
        '/eleve/new' => [[['_route' => 'app_eleve_new', '_controller' => 'App\\Controller\\EleveController::new'], null, ['GET' => 0, 'POST' => 1], null, false, false, null]],
        '/instrument' => [[['_route' => 'app_instrument_index', '_controller' => 'App\\Controller\\InstrumentController::index'], null, ['GET' => 0], null, false, false, null]],
        '/instrument/new' => [[['_route' => 'app_instrument_new', '_controller' => 'App\\Controller\\InstrumentController::new'], null, ['GET' => 0, 'POST' => 1], null, false, false, null]],
        '/intervention' => [[['_route' => 'app_intervention_index', '_controller' => 'App\\Controller\\InterventionController::index'], null, ['GET' => 0], null, false, false, null]],
        '/intervention/new' => [[['_route' => 'app_intervention_new', '_controller' => 'App\\Controller\\InterventionController::new'], null, ['GET' => 0, 'POST' => 1], null, false, false, null]],
        '/professeur' => [[['_route' => 'app_professeur_index', '_controller' => 'App\\Controller\\ProfesseurController::index'], null, ['GET' => 0], null, false, false, null]],
        '/professeur/new' => [[['_route' => 'app_professeur_new', '_controller' => 'App\\Controller\\ProfesseurController::new'], null, ['GET' => 0, 'POST' => 1], null, false, false, null]],
        '/professionnel' => [[['_route' => 'app_professionnel_index', '_controller' => 'App\\Controller\\ProfessionnelController::index'], null, ['GET' => 0], null, false, false, null]],
        '/professionnel/new' => [[['_route' => 'app_professionnel_new', '_controller' => 'App\\Controller\\ProfessionnelController::new'], null, ['GET' => 0, 'POST' => 1], null, false, false, null]],
    ],
    [ // $regexpList
        0 => '{^(?'
                .'|/_(?'
                    .'|error/(\\d+)(?:\\.([^/]++))?(*:38)'
                    .'|wdt/([^/]++)(*:57)'
                    .'|profiler/(?'
                        .'|font/([^/\\.]++)\\.woff2(*:98)'
                        .'|([^/]++)(?'
                            .'|/(?'
                                .'|search/results(*:134)'
                                .'|router(*:148)'
                                .'|exception(?'
                                    .'|(*:168)'
                                    .'|\\.css(*:181)'
                                .')'
                            .')'
                            .'|(*:191)'
                        .')'
                    .')'
                .')'
                .'|/accueil/([^/]++)(?'
                    .'|(*:222)'
                    .'|/edit(*:235)'
                    .'|(*:243)'
                .')'
                .'|/cours/([^/]++)(?'
                    .'|(*:270)'
                    .'|/edit(*:283)'
                    .'|(*:291)'
                .')'
                .'|/eleve/([^/]++)(?'
                    .'|(*:318)'
                    .'|/edit(*:331)'
                    .'|(*:339)'
                .')'
                .'|/in(?'
                    .'|strument/([^/]++)(?'
                        .'|(*:374)'
                        .'|/edit(*:387)'
                        .'|(*:395)'
                    .')'
                    .'|tervention/([^/]++)(?'
                        .'|(*:426)'
                        .'|/edit(*:439)'
                        .'|(*:447)'
                    .')'
                .')'
                .'|/profess(?'
                    .'|eur/([^/]++)(?'
                        .'|(*:483)'
                        .'|/edit(*:496)'
                        .'|(*:504)'
                    .')'
                    .'|ionnel/([^/]++)(?'
                        .'|(*:531)'
                        .'|/edit(*:544)'
                        .'|(*:552)'
                    .')'
                .')'
            .')/?$}sDu',
    ],
    [ // $dynamicRoutes
        38 => [[['_route' => '_preview_error', '_controller' => 'error_controller::preview', '_format' => 'html'], ['code', '_format'], null, null, false, true, null]],
        57 => [[['_route' => '_wdt', '_controller' => 'web_profiler.controller.profiler::toolbarAction'], ['token'], null, null, false, true, null]],
        98 => [[['_route' => '_profiler_font', '_controller' => 'web_profiler.controller.profiler::fontAction'], ['fontName'], null, null, false, false, null]],
        134 => [[['_route' => '_profiler_search_results', '_controller' => 'web_profiler.controller.profiler::searchResultsAction'], ['token'], null, null, false, false, null]],
        148 => [[['_route' => '_profiler_router', '_controller' => 'web_profiler.controller.router::panelAction'], ['token'], null, null, false, false, null]],
        168 => [[['_route' => '_profiler_exception', '_controller' => 'web_profiler.controller.exception_panel::body'], ['token'], null, null, false, false, null]],
        181 => [[['_route' => '_profiler_exception_css', '_controller' => 'web_profiler.controller.exception_panel::stylesheet'], ['token'], null, null, false, false, null]],
        191 => [[['_route' => '_profiler', '_controller' => 'web_profiler.controller.profiler::panelAction'], ['token'], null, null, false, true, null]],
        222 => [[['_route' => 'app_accueil_show', '_controller' => 'App\\Controller\\AccueilController::show'], ['id'], ['GET' => 0], null, false, true, null]],
        235 => [[['_route' => 'app_accueil_edit', '_controller' => 'App\\Controller\\AccueilController::edit'], ['id'], ['GET' => 0, 'POST' => 1], null, false, false, null]],
        243 => [[['_route' => 'app_accueil_delete', '_controller' => 'App\\Controller\\AccueilController::delete'], ['id'], ['POST' => 0], null, false, true, null]],
        270 => [[['_route' => 'app_cours_show', '_controller' => 'App\\Controller\\CoursController::show'], ['id'], ['GET' => 0], null, false, true, null]],
        283 => [[['_route' => 'app_cours_edit', '_controller' => 'App\\Controller\\CoursController::edit'], ['id'], ['GET' => 0, 'POST' => 1], null, false, false, null]],
        291 => [[['_route' => 'app_cours_delete', '_controller' => 'App\\Controller\\CoursController::delete'], ['id'], ['POST' => 0], null, false, true, null]],
        318 => [[['_route' => 'app_eleve_show', '_controller' => 'App\\Controller\\EleveController::show'], ['id'], ['GET' => 0], null, false, true, null]],
        331 => [[['_route' => 'app_eleve_edit', '_controller' => 'App\\Controller\\EleveController::edit'], ['id'], ['GET' => 0, 'POST' => 1], null, false, false, null]],
        339 => [[['_route' => 'app_eleve_delete', '_controller' => 'App\\Controller\\EleveController::delete'], ['id'], ['POST' => 0], null, false, true, null]],
        374 => [[['_route' => 'app_instrument_show', '_controller' => 'App\\Controller\\InstrumentController::show'], ['id'], ['GET' => 0], null, false, true, null]],
        387 => [[['_route' => 'app_instrument_edit', '_controller' => 'App\\Controller\\InstrumentController::edit'], ['id'], ['GET' => 0, 'POST' => 1], null, false, false, null]],
        395 => [[['_route' => 'app_instrument_delete', '_controller' => 'App\\Controller\\InstrumentController::delete'], ['id'], ['POST' => 0], null, false, true, null]],
        426 => [[['_route' => 'app_intervention_show', '_controller' => 'App\\Controller\\InterventionController::show'], ['id'], ['GET' => 0], null, false, true, null]],
        439 => [[['_route' => 'app_intervention_edit', '_controller' => 'App\\Controller\\InterventionController::edit'], ['id'], ['GET' => 0, 'POST' => 1], null, false, false, null]],
        447 => [[['_route' => 'app_intervention_delete', '_controller' => 'App\\Controller\\InterventionController::delete'], ['id'], ['POST' => 0], null, false, true, null]],
        483 => [[['_route' => 'app_professeur_show', '_controller' => 'App\\Controller\\ProfesseurController::show'], ['id'], ['GET' => 0], null, false, true, null]],
        496 => [[['_route' => 'app_professeur_edit', '_controller' => 'App\\Controller\\ProfesseurController::edit'], ['id'], ['GET' => 0, 'POST' => 1], null, false, false, null]],
        504 => [[['_route' => 'app_professeur_delete', '_controller' => 'App\\Controller\\ProfesseurController::delete'], ['id'], ['POST' => 0], null, false, true, null]],
        531 => [[['_route' => 'app_professionnel_show', '_controller' => 'App\\Controller\\ProfessionnelController::show'], ['id'], ['GET' => 0], null, false, true, null]],
        544 => [[['_route' => 'app_professionnel_edit', '_controller' => 'App\\Controller\\ProfessionnelController::edit'], ['id'], ['GET' => 0, 'POST' => 1], null, false, false, null]],
        552 => [
            [['_route' => 'app_professionnel_delete', '_controller' => 'App\\Controller\\ProfessionnelController::delete'], ['id'], ['POST' => 0], null, false, true, null],
            [null, null, null, null, false, false, 0],
        ],
    ],
    null, // $checkCondition
];
