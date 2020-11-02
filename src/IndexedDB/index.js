import DB from './DexieDB';

export async function sync(res) {
  if (res.data) {
    const { data } = res;
    // avoid storing success and msg returns from API
    delete data.success;
    delete data.msg;
    delete data.error;
    console.log(data);
    // iterates over dada array/object
    for (const key in data) {
      if (data.hasOwnProperty(key)) {
        const table = key;
        try {
          DB[table].bulkDelete('_id').catch((e) => {});
          DB[table].bulkPut(data[key]).catch((e) => {});
          console.log('IndexeDB updated', table);
        } catch (error) {
          console.log('error', table);
        }
      }
    }
  }
}

/**
 * Get all documents in table
 * @param {string} table Table name
 * @return {Array} Array with all table data or empty Array []
 */
export async function GetAll(table) {
  const res = await DB[table].toArray();
  if (res && res.length !== 0) return res;
  return [];
}

/**
 * Find one document by _id
 * @param {string} table Table name
 * @param {mongo UUID (string)} _id Object's _id
 * @returns {object} Found document or empty object {}
 */
export async function findById(table, _id) {
  const res = await DB[table].get(_id);
  if (res && res.length !== 0) return res;
  return {};
}

/**
 * add one document by _id
 * @param {string} table Table name
 * @param {Object} data Object with _id primary key
 * @returns {boolean} true or false
 */
export async function AddDB(table, data) {
  // insert
  console.log(`add db ${table} :`, data);
  const res = await DB[table].add({ ...data }).catch((e) => {});
  if (res && res.length !== 0) return true;
  return false;
}

/**
 * Find one document by _id
 * @param {string} table Table name
 * @param {Object} data Object with _id primary key
 * @returns {boolean} true or false
 */
export async function UpdateDB(table, data) {
  // update
  console.log(`update db ${table} :`, data);
  const res = await DB[table].update(data._id, { ...data }).catch((e) => {});
  if (res && res.length !== 0) return true;
  return false;
}

/**
 *
 * @param {string} table Table name
 * @param {mongo UUID (string)} _id Object's _id to be deleted
 * @returns {boolean} true if success, false otherwise
 */
export async function DeleteDB(table, _id) {
  console.log('trying to delete IndexedDB table', table, '_id:', _id);
  try {
    await DB[table]
      .where({ _id })
      .delete()
      .catch((e) => {});
    return true;
  } catch (error) {
    return false;
  }
}
