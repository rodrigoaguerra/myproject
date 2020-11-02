//folder IndexedDB
import Dexie from 'dexie';

const db = new Dexie(process.env.REACT_APP_NAME);

db.version(1).stores({
  customers: '++id',
});

db.open();

export default db;
