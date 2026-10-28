class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261028.015048.6577d6a"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261028-015048-6577d6a/marvel-darwin-arm64"
    sha256 "2dc95cdb44741bc0a6a2ef67241ceb6bbf27f38542e33a38ad997f7b316463cb"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261028-015048-6577d6a/marvel-darwin-amd64"
    sha256 "5bb855e2da02b0c83935b124d836fba777f226b65bb85e5042f2ab8a1b5ad6db"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261028-015048-6577d6a/marvel-linux-arm64"
    sha256 "68b24aefbff908664ca60bff783f3c30b543f4383bd5b97ef0235ab0ee145180"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261028-015048-6577d6a/marvel-linux-amd64"
    sha256 "1a733d2184af8c0a5900e63f748d57f01fd0890307812e189daf84f5b167435b"
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
