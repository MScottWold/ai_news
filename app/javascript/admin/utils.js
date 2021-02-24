export async function getNews(text) {
  var resp = await deepai.callStandardApi("text-generator", {
    text: text,
  });
  console.log(resp);
  return resp.output;
}