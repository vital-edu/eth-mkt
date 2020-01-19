import { bytecode, abi } from './EscrowContract.json';
import { web3 } from './web3Util.js';

const EscrowContract = new web3.eth.Contract(abi);// web3 contract instance

const deploy = (value, arbiterAddress, beneficiaryAddress, depositorAddress) => {
  const deployParameters = {
    arguments: [arbiterAddress, beneficiaryAddress],
    data: bytecode,
  }
  return EscrowContract.deploy(deployParameters).estimateGas().then((gas) => {
    return EscrowContract.deploy(deployParameters).send({
      from: depositorAddress,
      gas: gas,
      value: value,
    });
  })
}

export default deploy;
