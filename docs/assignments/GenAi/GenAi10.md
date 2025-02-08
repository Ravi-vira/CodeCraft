<pre>
<code>
// import ollama from "ollama";

// async function runChat() {
//   try {
//     const response = await ollama.chat({
//       model: "llama3.2:latest",
//       messages: [{ role: 'user', content: "Generate marketing emails" }]
//     });

//     console.log("Chatbot Response:", response.message.content);
//   } catch (error) {
//     console.error("Error occurred:", error.message);
//   }
// }

// runChat();

//Stage 2:

// import ollama from "ollama";
// import fs from "fs";

// let q= fs.readFileSync("./q1.txt", "utf-8");
// console.log(q)

// askQuestion()
// async function askQuestion() {
//   try {
//     const response = await ollama.chat({
//       model: "llama3.2:latest",
//       messages: [{ role: 'user', content: q }]
//     });

//     fs.writeFileSync("./a1.txt", response.message.content);

//   } catch (error) {
//     console.error("Error occurred:", error.message);
//   }
// }

// stage 3:
// import fs from 'fs';
// import ollama from 'ollama';

// let folder = 'Questions';

// async function runChat(question) {
//   try {
//     const response = await ollama.chat({
//       model: "llama3.2:1b",
//       messages: [{ role: 'user', content: question }]
//     });

//     return response.message.content;
//   } catch (error) {
//     console.error("Error occurred:", error.message);
//   }
// }


// fs.readdir(folder, (err, files) => {
//   if (err) {
//     return console.error('Error reading directory:', err.message);
//   }

//   files.forEach((file) => {
//     const filepath = `${folder}/${file}`;
//     fs.readFile(filepath, 'utf8', async (err, question) => {
//       if (err) {
//         return console.error(`Error reading file ${file}:`, err.message);
//       }
//       let ans_file = file
//       const response = await runChat(question);
//       fs.mkdirSync('Answers', { recursive: true })
//       let answer_path = `Answers/${ans_file.replace('Q','A')}`
//       fs.appendFileSync(answer_path, response)
//     });
//   });
// });


//stage 4

import ollama from "ollama";
import fs from "fs";
let subDir = process.argv;
getQuestion(subDir)


async function getQuestion(subDir) {
  try{
      let q=Math.floor(Math.random() * 3) + 1
      let p=`./input/${subDir[2]}/q${q}.txt`
      let out=`./output2/${subDir[2]}/q${q}.txt`
      try{
        let question=fs.readFileSync(p, "utf-8");
        console.log(question)

        try {
          const response = await ollama.chat({
            model: "qwen2:0.5b",
            messages: [{ role: "user", content: question }]
          });
          const a=response.message.content;
      
          await fs.writeFileSync(out, a);
          console.log(`Response written to: ${out}.txt `);
        } catch (error) {
          console.error("Error :", error.message);
        }
      }
      catch (error) {
            console.error("Error occurred:", error.message);
      }
  }
  catch (error) {
        console.error("Error occurred at:", error.message);
  }
}
</code>
</pre>
