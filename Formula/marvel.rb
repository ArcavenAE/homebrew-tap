class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.081206.a9f5a89"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-081206-a9f5a89/marvel-darwin-arm64"
    sha256 "b7014123567bd4a31379053aefb2d2423d9a6558881800134c88904987815588"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-081206-a9f5a89/marvel-darwin-amd64"
    sha256 "a21d1c36d65c792c3010eaff492870c4a051596dc20725e61c8496616f0ba001"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-081206-a9f5a89/marvel-linux-arm64"
    sha256 "20854322e0171151b46bc0fe7027d96d2b438dc54804be5fbc4a48545dd23aef"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-081206-a9f5a89/marvel-linux-amd64"
    sha256 "669d8b7decabef36cb753779ca064348aebe451c1ac09a0941cc8ca79ee625dd"
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
