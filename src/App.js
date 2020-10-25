import React from 'react';
import { ThemeProvider } from '@material-ui/styles';
import Routers from './Routes';
import theme from './styles';
import { Snackbar } from 'common';

function App() {
  return (
    <ThemeProvider theme={theme}>
      <>
        <Routers />
        <Snackbar />
      </>
    </ThemeProvider>
  );
}

export default App;
