class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.183654.e9512cf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-183654-e9512cf/marvel-darwin-arm64"
    sha256 "d26e7fdca12341ac1be00434c224d07593fe4d31cd4ff60623075aa6d7541920"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-183654-e9512cf/marvel-darwin-amd64"
    sha256 "0eaaf4073812e1b451fafac464505050f123bb269a740ad08bd84e2483561fd3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-183654-e9512cf/marvel-linux-arm64"
    sha256 "e29c9ee83534b758773cf26b326a52b07439729d64fde5e5e697ffee20f77996"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-183654-e9512cf/marvel-linux-amd64"
    sha256 "efbb365062c14fc17b07af373c29b6af5fdf8c938ddc1a05908b450e812462cc"
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
