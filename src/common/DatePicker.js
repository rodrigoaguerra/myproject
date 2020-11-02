import 'date-fns';
import React from 'react';
import Grid from '@material-ui/core/Grid';
import DateFnsUtils from '@date-io/date-fns';
import {
  MuiPickersUtilsProvider,
  KeyboardDatePicker,
} from '@material-ui/pickers';

export default function MaterialUIPickers(props) {
  const label = props?.label ?? 'Date picker dialog';
  const format = props?.format ?? 'dd/MM/yyyy';
  const initialValue = props?.value ?? new Date();
  const onChange = props?.onChange ?? null;

  // The first commit of Material-UI
  const [selectedDate, setSelectedDate] = React.useState(initialValue);

  const handleDateChange = (date) => {
    setSelectedDate(date);
    if (onChange) {
      onChange(date);
    }
  };

  return (
    <MuiPickersUtilsProvider utils={DateFnsUtils}>
      <Grid container>
        <KeyboardDatePicker
          style={{ minWidth: '100%' }}
          inputVariant='outlined'
          id='date-picker-dialog'
          label={label}
          format={format}
          value={selectedDate}
          onChange={handleDateChange}
          InputAdornmentProps={{ position: 'start' }}
          KeyboardButtonProps={{
            'aria-label': 'change date',
          }}
        />
      </Grid>
    </MuiPickersUtilsProvider>
  );
}
