import { createSlice, createAsyncThunk } from "@reduxjs/toolkit";
import { postSession, deleteSession, postUser } from "../../util/api_util";
import { modalHidden } from "../navigation/ui_slice";

export const signUp = createAsyncThunk(
  "session/signUp",
  async (user, { dispatch }) => (
    await postUser(user).then((response) => {
      if (response.ok) { dispatch(modalHidden()) };

      return response.json();
    })
  ),
)

export const logIn = createAsyncThunk(
  "session/logIn",
  async (user, { dispatch }) => (
    await postSession(user).then((response) => {
      if (response.ok) { dispatch(modalHidden()) };

      return response.json();
    })
  ),
);

export const logOut = createAsyncThunk(
  "session/logOut",
  async () => await deleteSession().then((response) => response.json()),
)

export const sessionSlice = createSlice({
  name: "session",
  initialState: {
    errors: [],
    currentUser: null,
  },
  reducers: {},
  selectors: {
    selectCurrentUser: (state) => state.currentUser,
  },
  extraReducers: (builder) => {
    builder
      .addCase(signUp.fulfilled, (state, action) => {
        if (action.payload.errors) {
          state.errors.push(...action.payload.errors);
        } else {
          state.currentUser = action.payload.username;
        }
      })
      .addCase(logIn.fulfilled, (state, action) => {
        if (action.payload.errors) {
          state.errors.push(...action.payload.errors);
        }
      })
      .addCase(logOut.fulfilled, (state) => {
        state.currentUser = null;
      })
      .addCase("ui/modalHidden", (state) => {
        state.errors = [];
      })
  },
});

export const { selectCurrentUser } = sessionSlice.selectors;

export default sessionSlice.reducer;
