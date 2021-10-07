import React from 'react';
import { BrowserRouter, Switch, Route } from 'react-router-dom';
import { RouteWithTemplate } from './common';
import Template from './template';
import { Auth, Dashboard, Customers, Store } from './views';
function Routers() {
  return (
    <BrowserRouter>
      <Switch>
        <Route exact path='/' component={Auth} />
        <Route exact path='/store' component={Store} />
        <RouteWithTemplate
          exact
          path='/dashboard'
          template={Template}
          component={Dashboard}
        />
        <RouteWithTemplate
          exact
          path='/customers'
          template={Template}
          component={Customers}
        />
      </Switch>
    </BrowserRouter>
  );
}

export default Routers;
