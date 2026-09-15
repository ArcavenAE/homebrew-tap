class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260915.205430.fee0075"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-205430-fee0075/marvel-darwin-arm64"
    sha256 "ae131924221cd2d907a41d7d78c46c1cbd0a5e013c2e670629d57a846141fd73"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-205430-fee0075/marvel-darwin-amd64"
    sha256 "0c879c07ef621da323b5650b5c61d55501d979b4d46505f61606dffd045c3a70"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-205430-fee0075/marvel-linux-arm64"
    sha256 "58107d8c96b2f55ae95f3cee5b68df572e00fc11a681a78cc8ad37a7fdb12687"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260915-205430-fee0075/marvel-linux-amd64"
    sha256 "f02d309a3f17229af7679fabab6c5bc4c2d209a7b0334b50e4e1cf978f470aa9"
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
