// (function() {
//   var res = {
//     error: "",
//     data: {}
//   };
//   try {
//     res.data = "test output";
//   } catch (e) {
//     res.error = e ? e.toString() : "error";
//   }
//   return JSON.stringify(res);
// })();

// (function() {
//   let privateKey =
//     "5fc7e2d2dd5f9e414a71558b7ef9c1901d99b3340652723b60bf119c5e1df1b3";
//   let address = "1BZRVgz7zpcm1rJZh5H3uCtggQbfyo8jwr";
//   let password = "12345";
//   const keystore = window.ruffChain.toV3Keystore(privateKey, address, password);
//   const keystoreStr = JSON.stringify(keystore);
//   const key = window.ruffChain.fromV3Keystore(keystoreStr, password);
//   const res = {};
//   // (key === privateKey).toString();
//   return window.ruffChain.addressFromSecretKey(privateKey) === address;
// })();
(function() {
  const txData = {
    method: "mortgage",
    fee: 1,
    value: 2,
    input: 12,
    nonce: 1
  };
  let res = window.ruffChain.signTx(
    JSON.stringify(txData),
    "56115a44355a854354601aaa1d59669ae53b431b4d48ccea2d4c855325314b9f"
  );
  return res;
})();