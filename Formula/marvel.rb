class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.150401.dd63426"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-150401-dd63426/marvel-darwin-arm64"
    sha256 "9ee19a4f9d281a059f79bde1a41351e539b225af82e1f8f4d5f4f213a2959cf5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-150401-dd63426/marvel-darwin-amd64"
    sha256 "330e7e9b761e05f105d6476170b8fc6be26c8ff9ff28c85adbdffeeec792dca5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-150401-dd63426/marvel-linux-arm64"
    sha256 "36f281610c7a5d809d47dbb4023e5c053984e238b61f9737d70756718d37ebc5"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-150401-dd63426/marvel-linux-amd64"
    sha256 "85ff29eebc1b4f3f97a3480ef0fe26fc46d33cb4e231dca6e19d55a7268e9086"
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
