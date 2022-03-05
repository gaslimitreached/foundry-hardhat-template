import { run, ethers } from 'hardhat';

async function deploy () {
  await run('compile')
  const Contract = await ethers.getContractFactory('Mover')
  const contract = await Contract.deploy()
  console.log(contract.address)
}

(async () => {
  try {
    await deploy();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
})()
