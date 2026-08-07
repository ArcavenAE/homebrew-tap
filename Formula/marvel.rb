class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.150356.603133e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-150356-603133e/marvel-darwin-arm64"
    sha256 "734fcd5e792758b3907d2996a3f7d713a24dda993eef14d7a6f33b12f5a2e6f6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-150356-603133e/marvel-darwin-amd64"
    sha256 "f1ad160c1047ff9737a5a6cae8931fbc4b13d586b3b3b7b9694fa00363566bc8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-150356-603133e/marvel-linux-arm64"
    sha256 "a716c53bd075c39d2e85617e9c7f4ff558064a24001c7baad6d032c038b63a04"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-150356-603133e/marvel-linux-amd64"
    sha256 "350c17c702ef3aadd04b74ceaf8f8c336d488a17c8a1edd3272b514b97a40d07"
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
