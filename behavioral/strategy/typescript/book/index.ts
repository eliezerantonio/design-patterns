export interface RouteStrategy {
  buildRoute(origin: string, destination: string): string;
}

class RoadStrategy implements RouteStrategy {
  buildRoute(origin: string, destination: string): string {
    return `Road route from ${origin} to ${destination}`;
  }
}

class WalkingStratey implements RouteStrategy {
  buildRoute(origin: string, destination: string): string {
    return `Walking route fromm ${origin} to ${destination}`;
  }
}

class PublicTransporteStratey implements RouteStrategy {
  buildRoute(origin: string, destination: string): string {
    return `public transporte route from ${origin} to ${destination}`;
  }
}

class Navigator {
  private routeStrategy: RouteStrategy;

  setRouteStrategy(strategy: RouteStrategy) {
    this.routeStrategy = strategy;
  }

  buildRoute(origin: string, destination: string): string {
    if (this.routeStrategy) {
      return this.routeStrategy.buildRoute(origin, destination);
    } else {
      return "No route strategy set";
    }
  }
}

const navigator = new Navigator();

navigator.setRouteStrategy(new RoadStrategy());
console.log(navigator.buildRoute("City A", "City B"));

navigator.setRouteStrategy(new WalkingStratey());
console.log(navigator.buildRoute("Park X", "Moseum B"));

navigator.setRouteStrategy(new PublicTransporteStratey());
console.log(navigator.buildRoute("Station A", "Station B"));