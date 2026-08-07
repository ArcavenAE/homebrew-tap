class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.151946.021f579"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-151946-021f579/marvel-darwin-arm64"
    sha256 "b4eac369f8675a94b03d6318f55073a4c821c58f3a48a42f6cca5e2c4400e026"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-151946-021f579/marvel-darwin-amd64"
    sha256 "50dbe3249db05410d57d5f3bc45526b94ce80a382dd27b407b491936f0cde0e7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-151946-021f579/marvel-linux-arm64"
    sha256 "2e22fa76e017744dded9ae3816bfc785ab603f0351d4ea3120d05d28581f277e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-151946-021f579/marvel-linux-amd64"
    sha256 "cd1cf2c3726f92704de5d9cff3da7d6e1c1d13cb706fd633932507adf7c05c77"
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
