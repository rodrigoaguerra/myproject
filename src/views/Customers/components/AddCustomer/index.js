import React, { useState } from 'react';
import clsx from 'clsx';
import { makeStyles } from '@material-ui/core/styles';
import Drawer from '@material-ui/core/Drawer';
import Button from '@material-ui/core/Button';
import Form from './form';

const useStyles = makeStyles({
  list: {
    width: 600,
  },
  fullList: {
    width: 'auto',
  },
});

export default function TemporaryDrawer() {
  const classes = useStyles();
  const [state, setState] = React.useState({
    top: false,
    left: false,
    bottom: false,
    right: false,
  });

  const toggleDrawer = (anchor, open) => (event) => {
    if (
      event.type === 'keydown' &&
      (event.key === 'Tab' || event.key === 'Shift')
    ) {
      return;
    }

    setState({ ...state, [anchor]: open });
  };

  const list = (anchor) => (
    <div className={clsx(classes.fullList)} role='presentation'>
      <Form onClose={() => setState({ ...state, [anchor]: false })} />
    </div>
  );

  return (
    <>
      <Button
        color='primary'
        variant='contained'
        onClick={toggleDrawer('right', true)}
      >
        Add user
      </Button>
      <Drawer anchor={'right'} open={state['right']}>
        {list('right')}
      </Drawer>
    </>
  );
}
