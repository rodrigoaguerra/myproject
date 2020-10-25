import React from 'react';
import Button from '@material-ui/core/Button';
import TextField from '@material-ui/core/TextField';
import Link from '@material-ui/core/Link';
import Grid from '@material-ui/core/Grid';
import useStyles from '../styles';

export default function SingIn(props) {
  const classes = useStyles();
  return (
    <form className={classes.form} noValidate>
      <TextField
        variant='outlined'
        margin='normal'
        required
        fullWidth
        id='email'
        label='Email Address'
        name='email'
        autoComplete='email'
        autoFocus
      />
      <Button
        type='submit'
        fullWidth
        variant='contained'
        color='primary'
        className={classes.submit}
      >
        Password Recovery
      </Button>
      <Grid container>
        <Grid item xs>
          <Link onClick={() => props.changeView('signin')} variant='body2'>
            Return Login?
          </Link>
        </Grid>
        <Grid item>
          <Link onClick={() => props.changeView('singup')} variant='body2'>
            {"Don't have an account? Sign Up"}
          </Link>
        </Grid>
      </Grid>
    </form>
  );
}
