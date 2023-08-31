import WalletButton from "./walletButton";

export default function Home() {
      return (
            <main className="min-h-screen">
                  <div className="flex flex-col items-center justify-center h-screen ">
                        <div className="h-[300px] min-w-[150px] flex flex-col justify-between  backdrop-blur-2xl bg-[#290330]/30 rounded-lg mx-auto p-7 text-white border border-purple-950">                                                                     
                              <WalletButton />
                        </div>
                 </div>
            </main>
      );
}