import React, { useState } from 'react';
import CssBaseline from '@material-ui/core/CssBaseline';
import Paper from '@material-ui/core/Paper';
import IconButton from '@material-ui/core/IconButton';
import CancelIcon from '@material-ui/icons/Cancel';
import AddCircleOutline from '@material-ui/icons/AddCircleOutline';
import Typography from '@material-ui/core/Typography';
import Button from '@material-ui/core/Button';
import TextField from '@material-ui/core/TextField';
import Grid from '@material-ui/core/Grid';
import Avatar from '@material-ui/core/Avatar';
// import { RequestSytem } from 'config';
import { AddDB } from 'IndexedDB';
import useStyles from './styles';
import { DatePicker } from 'common';
import { ShowSnackbar } from 'common';

export default function SignUp(props) {
  const { onClose } = props;
  const classes = useStyles();

  const [name, setname] = useState('');
  const [birthdate, setbirthdate] = useState(new Date());
  const [email, setemail] = useState('');
  const [phone, setphone] = useState('');
  const [doc, setdoc] = useState('');

  const register = (data) => {
    // RequestSytem(`${process.env.REACT_APP_HOST}/account/register`, data);
    if (AddDB('customers', data)) {
      ShowSnackbar('A customer has been registered');
      // clear form
      setname('');
      setbirthdate(new Date());
      setemail('');
      setphone('');
      setdoc('');
    } else {
      ShowSnackbar('there was an error registering the client');
    }
  };

  return (
    <Grid container component='main' className={classes.root}>
      <CssBaseline />
      <Grid item xs={12} sm={8} md={5} component={Paper} elevation={6} square>
        <div className={classes.paper}>
          <Grid container justify='flex-start'>
            <IconButton onClick={() => onClose()} aria-label='cancel'>
              <CancelIcon />
            </IconButton>
          </Grid>
          <Avatar className={classes.avatar}>
            <AddCircleOutline />
          </Avatar>
          <Typography component='h1' variant='h5'>
            Add Customer
          </Typography>
          <form className={classes.form} noValidate>
            <Grid container spacing={2}>
              <Grid item xs={12} sm={6}>
                <TextField
                  name='name'
                  variant='outlined'
                  required
                  fullWidth
                  id='name'
                  label='Name'
                  value={name}
                  onChange={(e) => setname(e.target.value)}
                />
              </Grid>
              <Grid item xs={12} sm={6}>
                <DatePicker
                  label='Birth Date'
                  value={birthdate}
                  onChange={(date) => setbirthdate(date)}
                />
              </Grid>
              <Grid item xs={12}>
                <TextField
                  variant='outlined'
                  required
                  fullWidth
                  id='email'
                  label='Email Address'
                  name='email'
                  value={email}
                  onChange={(e) => setemail(e.target.value)}
                />
              </Grid>
              <Grid item xs={12}>
                <TextField
                  variant='outlined'
                  required
                  fullWidth
                  name='phone'
                  label='Phone'
                  type='tel'
                  id='phone'
                  value={phone}
                  onChange={(e) => setphone(e.target.value)}
                />
              </Grid>
              <Grid item xs={12}>
                <TextField
                  variant='outlined'
                  required
                  fullWidth
                  name='doc'
                  label='Doc'
                  type='tel'
                  id='doc'
                  value={doc}
                  onChange={(e) => setdoc(e.target.value)}
                />
              </Grid>
            </Grid>
            <Button
              onClick={() =>
                register({
                  action: 'customer_register',
                  name,
                  birthdate,
                  email,
                  doc,
                  createdAt: new Date(),
                })
              }
              fullWidth
              variant='contained'
              color='primary'
              className={classes.submit}
            >
              Register
            </Button>
          </form>
        </div>
      </Grid>
    </Grid>
  );
}
