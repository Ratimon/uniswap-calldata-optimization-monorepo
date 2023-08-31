import { createWalletClient, createPublicClient, createTestClient, custom, http } from "viem";
import { hardhat, foundry, polygonMumbai, sepolia } from "viem/chains";
import "viem/window";

export function ConnectWalletClient() {
    // Check for window.ethereum
    let transport;
    if (window.ethereum) {
        transport = custom(window.ethereum);
    } else {
        const errorMessage ="MetaMask or another web3 wallet is not installed. Please install one to proceed.";
        throw new Error(errorMessage);
    }
    
    const walletClient = createWalletClient({
        chain: sepolia,
        transport: transport,
    });

    // const client = createTestClient({
    //     chain: foundry,
    //     mode: 'anvil',
    //     transport: http(), 
    //   })
    
    return walletClient;
}

export function ConnectPublicClient() {
    // Check for window.ethereum
    let transport;
    if (window.ethereum) {
        transport = custom(window.ethereum);
    } else {
        const errorMessage ="MetaMask or another web3 wallet is not installed. Please install one to proceed.";
        throw new Error(errorMessage);
    }
    
    const publicClient = createPublicClient({
        chain: sepolia,
        transport: transport,
    });

    // const client = createTestClient({
    //     chain: foundry,
    //     mode: 'anvil',
    //     transport: http(), 
    //   })
    
    return publicClient;
}
