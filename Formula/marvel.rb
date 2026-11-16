class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.021549.303b750"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-021549-303b750/marvel-darwin-arm64"
    sha256 "4e3438e5b5a9590e721c030d82193bcd1beb7dad8d2fb7567e30935e6b78d7cc"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-021549-303b750/marvel-darwin-amd64"
    sha256 "424e05374b00c6b7ac3df3f90185671684f1e1954225a41540c7b52953d567e7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-021549-303b750/marvel-linux-arm64"
    sha256 "745becef2e7ea3fac38a08f51a0e62c06bc974c40d939d3e9a58dcc5a13f46c6"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-021549-303b750/marvel-linux-amd64"
    sha256 "4c568029ce700a4a8159b1a845df2ab9c26e897a3d08ea89bf8e6ac44b8a221a"
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
