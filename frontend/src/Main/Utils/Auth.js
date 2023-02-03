import { fetchUserId } from "./FetchUserId";
// return the user data from the session storage
export const getUser = () => {
  const userStr = window.sessionStorage.getItem("user");
  if (userStr) return JSON.parse(userStr);
  else return null;
};

export const getUserId = () => {
  const userIdStr = window.sessionStorage.getItem("userId");
  if (userIdStr) return JSON.parse(userIdStr);
  else return null;
};

// return the token from the session storage
export const getToken = () => {
  return window.sessionStorage.getItem("token") || null;
};

// remove the token and user from the session storage
export const removeUserSession = () => {
  window.sessionStorage.removeItem("token");
  window.sessionStorage.removeItem("user");
  window.sessionStorage.removeItem("userId");
};

// set the token and user from the session storage
export async function setUserSession(token, user, ip_address) {
  console.log(token);
  console.log(user);
  var userId = await fetchUserId(user, token, ip_address);
  window.sessionStorage.setItem("token", token);
  window.sessionStorage.setItem("user", JSON.stringify(user));
  window.sessionStorage.setItem("userId", userId);
}
