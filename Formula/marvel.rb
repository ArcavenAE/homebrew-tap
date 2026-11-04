class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261104.211205.5421786"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-211205-5421786/marvel-darwin-arm64"
    sha256 "affb739d73faa52a160d43331dd1a99bb83b748acb49734713c122553d6cbfcc"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-211205-5421786/marvel-darwin-amd64"
    sha256 "34f24b6251866a41fb64f66d09e9c168ad154604896ef86f9870874e6d11d4df"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-211205-5421786/marvel-linux-arm64"
    sha256 "af1b8f6529891a9a2bea2480cd4f2525e5e2f551f24d28c76065130004f9e3b1"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261104-211205-5421786/marvel-linux-amd64"
    sha256 "1bfd34ed560b5bb7f86a63d60d5e9e05e4d3e47a292429df394a3baefdd8c364"
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
