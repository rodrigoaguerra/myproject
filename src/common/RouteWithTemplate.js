import React from 'react';
import { Route } from 'react-router-dom';
import { Redirect } from 'react-router-dom';
import PropTypes from 'prop-types';
import { getAuthorization } from 'config';

const RouteWithTemplate = (props) => {
  const { template: Template, component: Component, ...rest } = props;
  const token = true; //getAuthorization();

  if (!token || token === undefined) {
    return <Redirect to={'/'} />;
  }

  return (
    <Route
      {...rest}
      render={(matchProps) => (
        <Template>
          <Component {...matchProps} />
        </Template>
      )}
    />
  );
};

RouteWithTemplate.propTypes = {
  component: PropTypes.any.isRequired,
  template: PropTypes.any.isRequired,
  path: PropTypes.string,
};

export default RouteWithTemplate;
