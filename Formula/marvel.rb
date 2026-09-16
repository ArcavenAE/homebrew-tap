class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260916.101500.88fcebf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-101500-88fcebf/marvel-darwin-arm64"
    sha256 "fd8d55528761a4f4bdecea0a4fcc578ac6ec594d9bd2f180abb0232c445d368b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-101500-88fcebf/marvel-darwin-amd64"
    sha256 "411a24d4b7561e2ec06e06dc740f27cc054bd304dd2bb533f121d10546dc9813"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-101500-88fcebf/marvel-linux-arm64"
    sha256 "f72e2510079cdf00faff03fa001e2fbef11a5233ce77e5a80da6831691e6c40b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260916-101500-88fcebf/marvel-linux-amd64"
    sha256 "2a25268b4c504cdc2c46bb8b2211936a846fa2857e177a587f497e4e5b60c51e"
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
