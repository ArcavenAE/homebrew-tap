class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.205302.4f65cc3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-205302-4f65cc3/marvel-darwin-arm64"
    sha256 "564b10b6e824d8ea743db4dd5793c0271db388a558565e4b81c58852e34b7bff"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-205302-4f65cc3/marvel-darwin-amd64"
    sha256 "9a1444fd5d2e9ab90e492b0d86fa25bb079e5ad20b6052683da23aa0189a792c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-205302-4f65cc3/marvel-linux-arm64"
    sha256 "9ec321d3aedae08b60fa945ac10b1842caaf00e8e82ace5e0bf89c277e91a88d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-205302-4f65cc3/marvel-linux-amd64"
    sha256 "bc759a34565e23dfdbe73ee4693b1707e57567994fc9a3b14e9f51a49986eaf3"
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
