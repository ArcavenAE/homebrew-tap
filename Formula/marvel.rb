class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.065609.8211b31"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-065609-8211b31/marvel-darwin-arm64"
    sha256 "a6c444cb8ed10818f6d2f125bae9a1c4723d8d86c00fac1fb404a6e2a98ac9f0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-065609-8211b31/marvel-darwin-amd64"
    sha256 "913a32c0c566591058e9a4c50a9da35812916bf1892191f01aadf6ba22745394"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-065609-8211b31/marvel-linux-arm64"
    sha256 "8d5361225671f2724ad3d1512621dd03fa7106ccef923fd536ab0a3074aea57b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-065609-8211b31/marvel-linux-amd64"
    sha256 "03886966b33f713f64258a70e096080dac28cc5cbf8f7f553e001aedae8ed60a"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
