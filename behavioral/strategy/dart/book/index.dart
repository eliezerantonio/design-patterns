abstract class RouteStrategy {
  String buildRoute(String origin, String destination);
}

class RoadStrategy implements RouteStrategy {
  @override
  String buildRoute(String origin, String destination) {
    return "Road route from ${origin} to ${destination}";
  }
}

class WalkingStrategy implements RouteStrategy {
  @override
  String buildRoute(String origin, String destination) {
    return "Walking route from ${origin} to ${destination}";
  }
}

class PublicTransportStrategy implements RouteStrategy {
  @override
  String buildRoute(String origin, String destination) {
    return "public transporte route from ${origin} to ${destination}";
  }
}

class Navigator {
  RouteStrategy? _routeStrategy;

  setRouteStrategy(RouteStrategy strategy) {
    this._routeStrategy = strategy;
  }

  String buildRoute(String origin, String destination) {
    if (_routeStrategy != null) {
      return this._routeStrategy!.buildRoute(origin, destination);
    } else {
      return "No route strategy set";
    }
  }
}

void main() {
  final navigator = Navigator();
 
 navigator.setRouteStrategy(new RoadStrategy());
  print(navigator.buildRoute("City A", "City B"));

  navigator.setRouteStrategy(new WalkingStrategy());
  print(navigator.buildRoute("Park X", "Moseum B"));

  navigator.setRouteStrategy(new PublicTransportStrategy());
  print(navigator.buildRoute("Station A", "Station B"));

}
