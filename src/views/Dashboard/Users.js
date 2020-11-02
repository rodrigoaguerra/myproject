import React, { useEffect, useState } from 'react';
import Link from '@material-ui/core/Link';
import { makeStyles } from '@material-ui/core/styles';
import Table from '@material-ui/core/Table';
import TableBody from '@material-ui/core/TableBody';
import TableCell from '@material-ui/core/TableCell';
import TableHead from '@material-ui/core/TableHead';
import TableRow from '@material-ui/core/TableRow';
import Title from './Title';
import { RequestSytem } from 'config';

// Generate Order Data
function createData(id, name, email, status, type, date) {
  return { id, name, email, status, type, date };
}

function preventDefault(event) {
  event.preventDefault();
}

const useStyles = makeStyles((theme) => ({
  seeMore: {
    marginTop: theme.spacing(3),
  },
}));

// list user
const listUsers = (setUsers) => {
  const data = { data: 'asdas' };
  RequestSytem(`${process.env.REACT_APP_HOST}/account/list`, data, function (
    users,
  ) {
    console.log('users', users);
    const list = users.map((user) =>
      createData(
        user.id,
        user.firstname + user.lastname,
        user.email,
        user.status,
        user.type,
        user.date_create,
      ),
    );
    setUsers(list);
  });
};

export default function Users() {
  const classes = useStyles();
  const [users, setUsers] = useState([]);

  useEffect(() => {
    listUsers(setUsers);
  }, []);

  return (
    <React.Fragment>
      <Title>Recent Users</Title>
      <Table size='small'>
        <TableHead>
          <TableRow>
            <TableCell>Name</TableCell>
            <TableCell>Email</TableCell>
            <TableCell>Status</TableCell>
            <TableCell align='right'>Type</TableCell>
            <TableCell>Date</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {users.map((row) => (
            <TableRow key={row.id}>
              <TableCell>{row.name}</TableCell>
              <TableCell>{row.email}</TableCell>
              <TableCell>{row.status}</TableCell>
              <TableCell align='right'>{row.type}</TableCell>
              <TableCell>{row.date}</TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
      <div className={classes.seeMore}>
        <Link color='primary' href='#' onClick={preventDefault}>
          See more Users
        </Link>
      </div>
    </React.Fragment>
  );
}
