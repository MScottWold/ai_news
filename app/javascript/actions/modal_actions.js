// action types
export const SHOW_MODAL = 'SHOW_MODAL';
export const HIDE_MODAL = 'HIDE_MODAL';

// action creators
export const showModal = modal => ({
  type: SHOW_MODAL,
  modal
});

export const hideModal = () => ({
  type: HIDE_MODAL
});