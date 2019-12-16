import 'package:angular_router/angular_router.dart';
import 'package:angulardart_test_components/src/features/dashboard/dashboard_component.template.dart' as dashboard_page;
import 'package:angulardart_test_components/src/components/data_table/data_table.template.dart' as data_page;
import 'components/not_found_component.template.dart' as not_found_template;
import 'features/auth/login/login_component.template.dart' as login_page;
import 'features/github_search/github_search_component.template.dart' as github_search;

class Routes {
  static final dashboard = RouteDefinition(
      routePath: RoutePath(path: 'dashboard'),
      component: dashboard_page.DashboardComponentNgFactory,
      useAsDefault: true
  );
  static final dataTable = RouteDefinition(
      routePath: RoutePath(path: 'data-table'),
      component: data_page.DataTableComponentNgFactory);
  static final loginPage = RouteDefinition(
      routePath: RoutePath(path: 'login-page'),
      component: login_page.LoginComponentNgFactory);
  static final githubSearch = RouteDefinition(
      routePath: RoutePath(path: 'github-search'),
      component: github_search.GithubSearchComponentNgFactory);

  static final root = RouteDefinition.redirect(path: '', redirectTo: 'dashboard');

  static final List<RouteDefinition> all = [
    root,
    dashboard,
    dataTable,
    loginPage,
    githubSearch,
    RouteDefinition(
      path: '.*',
      component: not_found_template.NotFoundComponentNgFactory,
    ),
  ];
}