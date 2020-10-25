import { createMuiTheme } from '@material-ui/core/styles';

const theme = createMuiTheme({
  palette: {
    background: {
      default: '#F4F6F8',
    },
  },
  status: {
    danger: '#f9c',
  },

  overrides: {
    // Style sheet name ⚛️
    MuiLink: {
      // // Name of the rule
      root: {
        // Some CSS
        cursor: 'pointer',
      },
    },
  },
});

export default theme;
