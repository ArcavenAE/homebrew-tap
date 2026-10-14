class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261014.211541.aae9134"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-211541-aae9134/marvel-darwin-arm64"
    sha256 "5b8eaf56d0a1b1adbe7fc210fcd885f9a8deff8d5ce15d26455df1e9acda939a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-211541-aae9134/marvel-darwin-amd64"
    sha256 "f908680f136528ae4708f6adb872e158c11601d0ae89b8f5bea4577f1733fdd7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-211541-aae9134/marvel-linux-arm64"
    sha256 "9034692696d5116cb810e049c707b905dac7a9df8bf635fdbca4e0e23588f2bd"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261014-211541-aae9134/marvel-linux-amd64"
    sha256 "999a64ae7fff63c1ed68d1a8d11b2143950f5fc6a7c05215d0cf906752be9640"
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
