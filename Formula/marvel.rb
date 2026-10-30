class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.180652.12843f0"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-180652-12843f0/marvel-darwin-arm64"
    sha256 "9a192fa942e02750f3b2cf6c4e790b45bc870b6baa07c48eeefb5afa4938b6f2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-180652-12843f0/marvel-darwin-amd64"
    sha256 "a37d5e4220914dc22dba33aff3cd47c29b6c20c14cdf9e387ce887a5e6964057"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-180652-12843f0/marvel-linux-arm64"
    sha256 "738afb186cc2c0a951ab7fe891b7784ae800fbec9881afa7dfd6e959e938cad8"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-180652-12843f0/marvel-linux-amd64"
    sha256 "58981aae5da5894540b4d0bcc79160ed3d4004eb5dcecd4c1287a6f8adbcb82d"
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
