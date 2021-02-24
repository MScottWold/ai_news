import { getNews } from '../admin/utils';

window.addEventListener("DOMContentLoaded", () => {
  deepai.setApiKey(window.deepApiKey);

  const getArticleButton = document.getElementById('get-ai-article');
  const headline = document.getElementById('article-headline');
  const textArea = document.getElementById('ai-generated-article');
  
  getArticleButton.addEventListener('click', (e) => {
    e.preventDefault();
    e.stopPropagation();
    getArticleButton.disabled = true;
    getNews(headline.value + '.').then(response => {
      textArea.value = response.split('<|endoftext|>')[0];
      getArticleButton.disabled = false;
    });
  });

  const nameSwapForm = document.getElementById('name-swap');
  nameSwapForm.addEventListener('submit', (e) => {
    e.preventDefault();
    const oldName = new RegExp(e.currentTarget[0].value, 'g');
    const newName = e.currentTarget[1].value;
    textArea.value = textArea.value.replace(oldName, newName);
  });
});