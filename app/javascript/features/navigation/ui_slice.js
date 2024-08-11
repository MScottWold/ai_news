import { createSlice } from "@reduxjs/toolkit";

export const uiSlice = createSlice({
  name: "ui",
  initialState: {},
  reducers: {
    modalDisplayed: (state, action) => {
      state.modal = action.payload;
    },
    modalHidden: (state) => {
      state.modal = null;
    },
  },
});

export const { modalDisplayed, modalHidden } = uiSlice.actions;

export default uiSlice.reducer;
