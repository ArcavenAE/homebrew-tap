class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261011.194200.f105d24"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261011-194200-f105d24/marvel-darwin-arm64"
    sha256 "59b32ea995fd5db86e827e39b82609d739b0e556112e54590ac4a6df8ad02bdb"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261011-194200-f105d24/marvel-darwin-amd64"
    sha256 "431f74c239f84e7fa6916000ac4d2ace979c371f4c6022facb4c157c9d0b77bc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261011-194200-f105d24/marvel-linux-arm64"
    sha256 "27a051f307e6a1bcd892a75f363e20d97d85869f5a1aa2f3f9b86b2335a07a8c"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261011-194200-f105d24/marvel-linux-amd64"
    sha256 "a57f886e024adf25ed73e66309a5b04f8d27afe78d424f4906fbdcb42824d70f"
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
