// hardhat hh502 err 해결을 위해
// const { TASK_COMPILE_SOLIDITY_GET_SOLC_BUILD } = require("hardhat/builtin-tasks/task-names");
// const path = require("path");

require("@nomiclabs/hardhat-waffle");
const fs = require("fs")
const privateKey = fs.readFileSync(".secret").toString()
const projectId = "abd91034b96340a8a8a2920493229893"

// subtask(TASK_COMPILE_SOLIDITY_GET_SOLC_BUILD, async (args, hre, runSuper) => {
//   if (args.solcVersion === "0.8.5") {
//     const compilerPath = path.join(__dirname, "soljson-v0.8.5-nightly.2021.5.12+commit.98e2b4e5.js");

//     return {
//       compilerPath,
//       isSolcJs: true, // if you are using a native compiler, set this to false
//       version: args.solcVersion,
//       // this is used as extra information in the build-info files, but other than
//       // that is not important
//       longVersion: "0.8.5-nightly.2021.5.12+commit.98e2b4e5"
//     }
//   }

//   // we just use the default subtask if the version is not 0.8.5
//   return runSuper();
// })

module.exports = {
  networks: {
    hardhat: {
      chainId: 1337
    },
    mumbai: {
      url: `https://polygon-mumbai.infura.io/v3/${projectId}`,
      accounts: [privateKey]
    }
    // ,mainnet: {}
  },
  // solidity: "0.8.5",
  solidity: "0.8.4",
};
