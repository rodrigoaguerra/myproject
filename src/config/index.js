import { ShowSnackbar } from 'common';
const headers = {
  // Accept: 'application/json',
  // 'Content-Type': 'application/json',
};

export function setAuthorization(token) {
  headers.Authorization = 'Bearer ' + token;
  // headers['Access-Control-Allow-Headers'] = 'http://localhost';
}

export function getAuthorization() {
  return headers.Authorization;
}

export function RequestSytem(url, data, callback) {
  const myRequest = new Request(url, {
    method: 'POST',
    headers: headers,
    body: JSON.stringify(data),
  });

  fetch(myRequest)
    .then((response) => {
      if (response.status === 200) {
        return response.json();
      } else {
        throw new Error('Ops! Houve um erro em nosso servidor.');
      }
    })
    .then((response) => {
      if (response.success) {
        ShowSnackbar(response.success);
        if (callback && response.data) {
          callback(response.data);
        }
      } else if (response.error) {
        ShowSnackbar(response?.error);
      } else {
        console.debug('ERROR > ', response);
        throw new Error(response.error);
      }
    })
    .catch((error) => {
      console.error(error);
    });
}
