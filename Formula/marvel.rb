class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.200907.11d4267"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-200907-11d4267/marvel-darwin-arm64"
    sha256 "a50f05d1fa0885963d55e2a24cceab124091c11cf17f2564fa6237a1446856dd"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-200907-11d4267/marvel-darwin-amd64"
    sha256 "12797d2878c21d9794c23f1ada5fcef72ecbcdfe801117ee700e2e814d15d82f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-200907-11d4267/marvel-linux-arm64"
    sha256 "70482c92fc492c2dadc1db10311e7a2633c2d465e082c733fa3a99a8e6b08b89"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-200907-11d4267/marvel-linux-amd64"
    sha256 "c8428d95b9697247ae956f47fb0e96c35dbd7c924ff0a5f14f5d43b238d42c9d"
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
