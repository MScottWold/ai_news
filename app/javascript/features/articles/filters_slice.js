import { createSlice } from "@reduxjs/toolkit";
import { fetchArticles } from "./articles_slice";

export const filtersSlice = createSlice({
  name: "filters",
  initialState: {},
  reducers: {
    clearedCollection: (state) => {
      state.collection = [];
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(fetchArticles.fulfilled, (state, action) => {
        const filterName = Object.keys(action.payload.filter)[0]
        if (filterName in state) {
          state[filterName].push(...action.payload.filter[filterName]);
        } else {
          Object.assign(state, action.payload.filter);
        }
      })
  },
});

// Action Creators
export const { clearedCollection } = filtersSlice.actions;

// Reducer
export default filtersSlice.reducer;
