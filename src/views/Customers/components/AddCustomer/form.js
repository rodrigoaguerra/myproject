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
import uuid from 'uuid/v1';

export default function SignUp(props) {
  const { onClose } = props;
  const classes = useStyles();
  const initialState = {
    action: 'customer_register',
    hash: uuid(),
    name: '',
    doc: '085163449-40',
    email: 'ekaterina.tankova@devias.io',
    phone: '304-428-3097',
    birthdate: new Date(),
    address: {
      zipcode: '',
      street: '',
      number: '',
      city: '',
      hood: '',
      state: '',
      country: '',
      complement: '',
    },
    avatarUrl: '/images/avatars/avatar_3.png',
    createdAt: new Date(),
  };

  const [customer, setcustomer] = useState(initialState);

  const register = () => {
    // RequestSytem(`${process.env.REACT_APP_HOST}/account/register`, data);
    if (AddDB('customers', customer)) {
      ShowSnackbar('A customer has been registered');
      // clear form
      setcustomer(initialState);
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
                  value={customer.name}
                  onChange={(e) =>
                    setcustomer({ ...customer, name: e.target.value })
                  }
                />
              </Grid>
              <Grid item xs={12} sm={6}>
                <DatePicker
                  label='Birth Date'
                  value={customer.birthdate}
                  onChange={(date) => {
                    setcustomer({ ...customer, birthdate: date });
                  }}
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
                  value={customer.email}
                  onChange={(e) =>
                    setcustomer({ ...customer, email: e.target.value })
                  }
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
                  value={customer.phone}
                  onChange={(e) =>
                    setcustomer({ ...customer, phone: e.target.value })
                  }
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
                  value={customer.doc}
                  onChange={(e) =>
                    setcustomer({ ...customer, doc: e.target.value })
                  }
                />
              </Grid>
            </Grid>
            <Grid container spacing={2}>
              <Grid item xs={12} sm={6}>
                <TextField
                  name='zipcode'
                  variant='outlined'
                  required
                  fullWidth
                  id='zipcode'
                  label='Zip Code'
                  value={customer.address.zipcode}
                  onChange={(e) =>
                    setcustomer({
                      ...customer,
                      address: { ...customer.address, zipcode: e.target.value },
                    })
                  }
                />
              </Grid>
              <Grid item xs={12} sm={6}>
                <TextField
                  name='number'
                  variant='outlined'
                  required
                  fullWidth
                  id='number'
                  label='Number'
                  value={customer.address.number}
                  onChange={(e) =>
                    setcustomer({
                      ...customer,
                      address: { ...customer.address, number: e.target.value },
                    })
                  }
                />
              </Grid>
              <Grid item xs={12}>
                <TextField
                  variant='outlined'
                  required
                  fullWidth
                  id='street'
                  label='Street'
                  name='street'
                  value={customer.address.street}
                  onChange={(e) =>
                    setcustomer({
                      ...customer,
                      address: { ...customer.address, street: e.target.value },
                    })
                  }
                />
              </Grid>
              <Grid item xs={12}>
                <TextField
                  variant='outlined'
                  required
                  fullWidth
                  name='city'
                  label='City'
                  type='text'
                  id='city'
                  value={customer.address.city}
                  onChange={(e) => {
                    setcustomer({
                      ...customer,
                      address: { ...customer.address, city: e.target.value },
                    });
                  }}
                />
              </Grid>
              <Grid item xs={12}>
                <TextField
                  variant='outlined'
                  required
                  fullWidth
                  name='hood'
                  label='Hood'
                  type='text'
                  id='hood'
                  value={customer.address.hood}
                  onChange={(e) =>
                    setcustomer({
                      ...customer,
                      address: { ...customer.address, hood: e.target.value },
                    })
                  }
                />
              </Grid>
              <Grid item xs={12}>
                <TextField
                  variant='outlined'
                  required
                  fullWidth
                  name='state'
                  label='State'
                  type='text'
                  id='state'
                  value={customer.address.state}
                  onChange={(e) =>
                    setcustomer({
                      ...customer,
                      address: { ...customer.address, state: e.target.value },
                    })
                  }
                />
              </Grid>
            </Grid>
            <Button
              onClick={() => register()}
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
