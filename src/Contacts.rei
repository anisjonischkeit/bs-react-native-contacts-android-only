type emailAddress = {
  label: string,
  email: string,
};
type phoneNumber = {
  label: string,
  number: string,
};
type postalAddress = {
  label: string,
  formattedAddress: string,
  street: string,
  pobox: string,
  neighborhood: string,
  city: string,
  region: string,
  state: string,
  postCode: string,
  country: string,
};
type birthday = {
  day: float,
  month: float,
  year: float,
};
type contact = {
  recordID: string,
  backTitle: string,
  company: string,
  emailAddresses: array(emailAddress),
  familyName: Js.Nullable.t(string),
  givenName: string,
  middleName: Js.Nullable.t(string),
  jobTitle: string,
  phoneNumbers: array(phoneNumber),
  hasThumbnail: bool,
  thumbnailPath: string,
  postalAddresses: array(postalAddress),
  prefix: Js.Nullable.t(string),
  suffix: Js.Nullable.t(string),
  department: string,
  birthday,
};
type permissionsStatus = [ | `Authorized | `Denied | `Undefined];
type callback('a) = Belt.Result.t('a, string) => unit;

let getAll: callback(array(contact)) => unit;
let getAllWithoutPhotos: callback(array(contact)) => unit;
let getContactById: (string, callback(contact)) => unit;
let getCount: callback(int) => unit;
let getPhotoForId: (string, callback(string)) => unit;
let addContact: (contact, callback(unit)) => unit;
let openContactForm: (contact, callback(contact)) => unit;
let openExistingContact: (contact, callback(contact)) => unit;
let updateContact: (contact, callback(unit)) => unit;
let deleteContact: (contact, callback(unit)) => unit;
let getContactsMatchingString: (string, callback(array(contact))) => unit;
let getContactsByPhoneNumber: (string, callback(array(contact))) => unit;
let checkPermission: callback(permissionsStatus) => unit;
let requestPermission: callback(permissionsStatus) => unit;
let writePhotoToPath: (string, string, callback(bool)) => unit;