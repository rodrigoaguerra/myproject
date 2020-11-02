import React, { useState, useEffect } from 'react';
import { makeStyles } from '@material-ui/styles';
import { UsersToolbar, CustomersTable } from './components';
import { GetAll } from 'IndexedDB';
// import mockData from './data';

const useStyles = makeStyles((theme) => ({
  root: {
    padding: theme.spacing(3),
  },
  content: {
    marginTop: theme.spacing(2),
  },
}));

const UserList = () => {
  const classes = useStyles();
  const [users, setUsers] = useState(null);
  useEffect(() => {
    async function fetchData() {
      const customers = await GetAll('customers');
      setUsers(customers);
    }
    fetchData();
  }, []);

  if (users?.length > 0) {
    return (
      <div className={classes.root}>
        <UsersToolbar />
        <div className={classes.content}>
          <CustomersTable users={users} />
        </div>
      </div>
    );
  }

  return <div className={classes.root}>{'You don`t have customers'}</div>;
};

export default UserList;
