class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.211932.54c94ea"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-211932-54c94ea/marvel-darwin-arm64"
    sha256 "79d2dc870fbfe6662b06ee942cf20b1342f38ee3caa4470779a9d231ca698d6d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-211932-54c94ea/marvel-darwin-amd64"
    sha256 "569b9bec562c8adf6cdbb5c882fb5810f40b4e962809c00c16d2e9a39204220f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-211932-54c94ea/marvel-linux-arm64"
    sha256 "8bccfa8f3a8d782404b99a74dca02fa9c1db8bdd8490ecbd3f2eaaed5791c622"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-211932-54c94ea/marvel-linux-amd64"
    sha256 "1d17df888ae79dd5ebdcf115b3c08e0f76b763f65a11d1839fc97ed878aea2d7"
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
